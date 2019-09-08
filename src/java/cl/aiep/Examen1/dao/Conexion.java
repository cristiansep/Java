
package cl.aiep.Examen1.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Conexion {
    
     /*  private String server;
        private String user;
        private String base;
        private String clave;
        private int port;
        private String url;
        private Connection conexion;
    
    public Conexion(){//constructor
        this.clave  = "";
        this.server = "localhost";
        this.user   = "root";
        this.port   = 3306;
        this.base   = "ENA";
        
        //construimos string de conexion para conectarse a la base de datos  
        this.url  = "jdbc:mysql://" + this.server + ":" + this.port + "/";
        this.url += this.base + "?characterEncoding=latin1";
       // "jdbc:mysql://LOCALHOST:3306/Ejemplo?characterEncoding=latin1"
    }
 
   
    public void getConnection() throws SQLException{
        this.conexion = null; 
        
       try{
           //decirle al objeto Connection del JDK que trabaje o que 
           //realice encapsulamiento a partir de esta clase com.microsoft.sqlserver.jdbc.SQLServerDriver
           Class.forName("com.mysql.jdbc.Driver");
           //aca se creae la cponexion
           this.conexion = (Connection) DriverManager.getConnection(  
                   this.url,  
                   this.user, 
                   this.clave 
           );
           //para testint escribirmos en la consila exito
           System.out.println(" exito al conectarse");
       }catch(ClassNotFoundException ex){
           //rn caso de error escribimos en la consola error
            System.out.println("Error de conexion : " + ex.getMessage());
       }    
    }
     
    public ResultSet devolverDatos( String query ) throws SQLException{
    
        return this.conexion.createStatement().executeQuery( query );
        
    }*/
    
     
   static String bd = "ExamenVenta";
   static String login = "root";
   static String password = "";
   static String url = "jdbc:mysql://localhost/" + bd;
   // Esta variable va a guardar la conexion
  static Connection conn = null;

   /**
    * Constructor de la clase. Se llama constructor porque tiene el mismo
    * nombre que la clase y cuando se crea un nuevo objeto de esta clase es como
    * se va a inicializar al crear un nuevo objeto de este tipo.
    *
    */
   public Conexion() {
      try {
         //obtenemos el driver para mysql
         Class.forName("com.mysql.jdbc.Driver");
         //obtenemos una conexion con los parametros especificados anteriormente 
         conn = DriverManager.getConnection(url, login, password);
         // Si conn no es nulo, significa que pidimos conectarnos
         if (conn != null) {
            System.out.println("Connecting database [" + conn + "] OK");
         }
      } catch (SQLException e) // Excepcion ocurrida por la conexion 
      {
         System.out.println("Excepcion conexion: " + e.getMessage());         
      } catch (ClassNotFoundException e) // Excepcion ocurrida por no encontrar el driver
      {
         System.out.println("Excepcion driver: " + e.getMessage());         
      }
   }

   /**
    * Permite retornar la instancia de la conexion
    */
   public static Connection getConnection() {      
      return conn;
   }

   // Quitamos de memoria la conexion
   /*public void disconnect() {
      System.out.println("Closing database: [" + conn + "] OK");
      if (conn != null) {
         try {
            // System.out.println("Desconectado de " + bd + " OK");
            conn.close();
         } catch (SQLException e) {
            System.out.println(e);
         }
      }
   }*/
   
     public ResultSet devolverDatos(String query) throws SQLException {
        //es necesarioenviar la consulta desde afuera, es decir quien 
        //llama a este medodo, envia la query como argumento

        //retorna un resultset a partid de la consutla realizada
        return this.conn.createStatement().executeQuery(query);
    }
    
    
      public boolean guardarDatos( String query ) throws SQLException{
        return this.conn.createStatement().execute(query );
      }
   
       public ResultSet devolverDatos2(String query) throws SQLException {
        return this.conn.createStatement().executeQuery(query);
    }
       
         public ResultSet cargarCombo(String query) throws SQLException{
        return this.conn.createStatement().executeQuery( query );
    } 
    
}
