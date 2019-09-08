/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.aiep.Examen1.controller;

import cl.aiep.Examen1.dao.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author crist
 */
public class VentaControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VentaControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VentaControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String accion=request.getParameter("accion");
   
    
        if(accion.equalsIgnoreCase("eliminar")){
            String cod=request.getParameter("cod");
            try{
                
            String sql="delete from DetalleVenta where idDetalleVenta=?";
            Connection con=Conexion.getConnection();
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,cod);
            st.executeUpdate();
            request.getRequestDispatcher("detalleVenta.jsp").forward(request, response);
            }catch(Exception e){}
        
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String folio = request.getParameter("folio");
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        String fecha = request.getParameter("fecha");
        int nombre = Integer.parseInt(request.getParameter("nom"));


        /*Requerimiento r = new Requerimiento();
        r.setGerencia(ger);
        r.setDepto(depto);
        r.setEncargado(encar);
        r.setDescrpcion(des);*/
        Conexion cnx = new Conexion();
        boolean estado = false;
         RequestDispatcher rd;
        
        
       
            String query = "INSERT INTO Venta "
                    + "(VenFolio, VenFecha, VenTipo, CliRut) "
                    + "values "
                    + "( '" + folio + "','" + fecha + "', '" + tipo + "', '" + nombre + "')";
            //System.out.println(query);
           
            try {
                cnx.getConnection();
                estado = cnx.guardarDatos(query);
                if (estado = true) {
                    request.setAttribute("mensaje", "Venta registrada.");
                    //response.sendRedirect("registroRequerimiento.jsp");
                    rd = request.getRequestDispatcher("detalleVenta.jsp");
                    rd.forward(request, response);
                }

            } catch (SQLException ex) {
                Logger.getLogger(VentaControl.class.getName()).log(Level.SEVERE, null, ex);
            }
    

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
