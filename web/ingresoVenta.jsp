<%@page import="cl.aiep.Examen1.dao.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion combo =  new Conexion();
    combo.getConnection();
    ResultSet cliente =  combo.cargarCombo("select * from Cliente");
    ResultSet venta = combo.cargarCombo("select * from Venta");
    ResultSet tipo = combo.cargarCombo("select * from TipoVenta");
    
      String query ="";
            String filtroGerente ="";
            String filtroDepto = "";
            String filtroAsignar = "";
  

            query = "SELECT " +
                        "Venta.VenFolio as Folio," +
                        "TipoVenta.nombre as Tipo, " + 
                        "Venta.VenFecha as Fecha," +
                        "Cliente.CliRut as 'Rut Cliente', " +
                        "concat_ws(' ',Cliente.CliNombre ,Cliente.CliApellido ) as 'Nombre Cliente', " +
                        "DetalleVenta.VenPrecioVenta as Total " +
                     "from Venta " +
                        "inner join Cliente on Cliente.CliRut=Venta.CliRut " +
                        "inner join DetalleVenta on Venta.idVenta=DetalleVenta.idVenta " +
                        "inner join TipoVenta on Venta.VenTipo=TiPoVenta.VenTipo " ;
               
    ResultSet tabla     =  combo.cargarCombo(query);

 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px"> 

        <div style="padding-left: 800px">      
              
        </div>       

        <div class="jumbotron">
            <h2 >Ingreso Venta</h2>
            <h1>${mensaje}</h1>
        </div>
        <div class="container"> 
            <div>
              
               
            </div>
            <div style="padding-right: 500px"> 
                <form action="VentaControl" method="post">
                    
                    <div class="form-group">
                            <label for="exampleFormControlInput1">Folio</label>
                            <input type="text" name="folio" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese un Folio">
                        </div>

                    <div class="col-25">
                        <label for="country">Tipo Venta: </label>
                    </div>
                    <select class="form-control" name="tipo">
                        <option value="0">Seleccionar</option>
                          <%
                                    while(tipo.next()){
                                        out.println("<option value='"+tipo.getInt(1)+"'>");
                                        out.println(tipo.getString(2));
                                        out.println("</option>");
                                    } 
                                %>
                    </select><br>
                  
                     <div class="form-group">
                            <label for="exampleFormControlInput1">Fecha</label>
                            <input type="date" name="fecha" class="form-control" id="exampleFormControlInput1" placeholder="Ingrese la cantidad de muestras a recepcionar">
                        </div>
               
                    <div class="col-25">
                        <label for="country">Nombre: </label>
                    </div>
                    <select class="form-control" name="nom">
                        <option value="0">Seleccionar</option>
                       <%
                                    while(cliente.next()){
                                        out.println("<option value='"+cliente.getInt(1)+"'>");
                                        out.println(cliente.getString(2));
                                        out.println("</option>");
                                    } 
                                %>
                    </select><br>
                    
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">Registrar</button>
                        
                    </div>

                </form>

            </div>  
        </div>
              <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <table class="table table-bordered"  id="tablaDatos">
                <thead class="bg-primary">
                    <tr>
                        <th class="text-center">Folio</th>
                        <th class="text-center">Tipo Venta</th>
                          <th class="text-center">Fecha</th>
                            <th class="text-center">Rut Cliente</th>
                        <th class="text-center">Nombre Cliente</th>
                          <th class="text-center">Total Venta</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%
                    while (tabla.next()) {
                        out.println("<tr>");
                        out.println("<td>" + tabla.getString(1) + "</td>");
                        out.println("<td>" + tabla.getString(2) + "</td> ");
                        out.println("<td>" + tabla.getString(3) + "</td>");
                        out.println("<td>" + tabla.getString(4) + "</td>");
                        out.println("<td>" + tabla.getString(5) + "</td>");
                        out.println("<td>" + tabla.getString(6) + "</td>");
                        out.println("</tr>");
                    }
                %>
                  
                </tbody>
            </table>
          
            
        </div>   
                    

        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>

