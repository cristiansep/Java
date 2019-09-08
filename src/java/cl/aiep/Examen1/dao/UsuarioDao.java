/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.aiep.Examen1.dao;


import cl.aiep.Examen1.model.UsuarioBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author crist
 */
public class UsuarioDao {
    
          private Conexion conn;

    public UsuarioDao(Conexion conn) {
        this.conn = conn;
    }
    
    
    
     public UsuarioBean login(String email,String pass) {

        try {
            String sql = "select * from Usuario where email=? and password=?";
            PreparedStatement preparedStatement = conn.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, pass);
          
            ResultSet rs = preparedStatement.executeQuery();
            UsuarioBean usuario = new UsuarioBean(0);
            while (rs.next()) {
                
                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setPassword(rs.getString("password"));
            
              
             
            }
            return usuario;
        } catch (SQLException e) {
            System.out.println("Error UsuarioDao.login: " + e.getMessage());
            return null;
        }
    }
    
    
}
