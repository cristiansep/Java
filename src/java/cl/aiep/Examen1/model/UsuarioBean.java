
package cl.aiep.Examen1.model;

public class UsuarioBean {
    
     private int idusuario;
     private String nombre;
     private String password ;
     private String email ;

    public UsuarioBean(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UsuarioBean{" + "idusuario=" + idusuario + ", nombre=" + nombre + ", password=" + password + ", email=" + email + '}';
    }

   
  

    
}
