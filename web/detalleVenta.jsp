<%@page import="cl.aiep.Examen1.dao.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion combo = new Conexion();
    combo.getConnection();
    ResultSet prod = combo.cargarCombo("select * from Producto");
    ResultSet p = combo.cargarCombo("select concat_ws(' ', Producto.ProNombre ,ProMarca ) as Producto FROM Producto");
    ResultSet tipo = combo.cargarCombo("select * from TipoVenta");

    String query = "";
    String venta = "";
    String CProd = "";
    String filtroGerente = "";
    String filtroDepto = "";
    String filtroAsignar = "";

    query = "SELECT " +
            "DetalleVenta.VenCantidad as Cantidad, " +
            "concat_ws(' ', Producto.ProNombre ,ProMarca ) as Producto, " +
            "DetalleVenta.VenPrecioReal as Unitario, " +
            "(DetalleVenta.VenPrecioVenta * 0.19  + DetalleVenta.VenPrecioVenta) as Total, " +
            "DetalleVenta.idDetalleVenta " +
            "from Venta " +
            "inner join DetalleVenta on Venta.idVenta=DetalleVenta.idVenta " +
            "inner join Cliente on Cliente.CliRut=Venta.CliRut " +            
            "inner join TipoVenta on Venta.VenTipo=TiPoVenta.VenTipo " +
            "inner join Producto on DetalleVenta.ProCodigo=Producto.ProCodigo " ;

    ResultSet tabla2 = combo.cargarCombo(query);


venta = "select " + 
            "DetalleVenta.VenPrecioReal as Unitario, " +
            "(DetalleVenta.VenPrecioVenta * 0.19 ) as IVA, " +
            "(DetalleVenta.VenPrecioVenta * 0.19  + DetalleVenta.VenPrecioVenta) as Total " +
            "from Venta " +
            "inner join DetalleVenta on Venta.idVenta=DetalleVenta.idVenta " ;

ResultSet Sale = combo.cargarCombo(venta);

CProd=   "select " +
                  "Producto.ProCodigo," +
                  "concat_ws(' ', Producto.ProNombre ,ProMarca ) as Producto " +
                  "FROM Producto " ;

ResultSet c = combo.cargarCombo(CProd);

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
            <h2 >Detalle Venta</h2>
          
        </div>
        <div class="container"> 
            <div>

                <form class="needs-validation" novalidate>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom01">Cantidad</label>
                            <input type="text" class="form-control" id="validationCustom01" placeholder="Ingresar Cantidad" value="cant" required>
                            <div class="valid-feedback">

                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="col-25">
                                <label for="country">Producto: </label>
                            </div>
                            <select class="form-control" name="tipo">
                                <option value="0">Seleccionar</option>
                                <%       while (c.next()) {
                                        out.println("<option value='" + c.getInt(1) + "'>");
                                        out.println(c.getString(2));
                                        out.println("</option>");
                                    }
                                %>
                            </select><br>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustomUsername">%Desc</label>
                            <div class="input-group">
                                
                                <input type="number" class="form-control" id="validationCustomUsername" name="desc"   placeholder="0" aria-describedby="inputGroupPrepend" required>
                                <div class="invalid-feedback">

                                </div>
                            </div>
                            
                        </div>
                    </div>



                </form>
            </div>
            <div style="padding-right: 500px"> 


            </div>  
        </div>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <table class="table table-bordered"  id="tablaDatos">
                <thead class="bg-primary">
                    <tr>
                        <th class="text-center">Cantidad</th>
                        <th class="text-center">Producto</th>
                        <th class="text-center">Unitario</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Quitar</th>
                       
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%      while (tabla2.next()) {
                            out.println("<tr>");
                            out.println("<td>" + tabla2.getString(1) + "</td>");
                            out.println("<td>" + tabla2.getString(2) + "</td> ");
                            out.println("<td>" + tabla2.getString(3) + "</td>");
                            out.println("<td>" + tabla2.getString(4) + "</td>");
                           
                            out.println("<td style='text-align:center'><a href=VentaControl?accion=eliminar&cod="+ tabla2.getInt(5) +" class='btn btn-danger'>Eliminar</a></td>");
                            out.println("</tr>");
                        }
                    %>

                </tbody>
            </table>    <%
                        while (Sale.next()) {
                        out.println("<h3>Valor Neto: <span class='badge badge-secondary'>" + Sale.getString(1) + "</span></h3>");
                        out.println("<h3>IVA(19%): <span class='badge badge-secondary'>" + Sale.getString(2) + "</span></h3>");
                        out.println("<h3>Valor Total: <span class='badge badge-secondary'>" + Sale.getString(3) + "</span></h3>");
                        }
                     %>
                     <br><a class="btn btn-primary" href="ingresoVenta.jsp" role="button">Volver al menu</a>

        </div>   
                   

        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>   
        
        <form action="EliminarVenta" method="POST" id="formActualizar">
        <input type="hidden" id="idDetalleVenta" name="idDetalleVenta">
    </form>
    <script>
        function CerrarTicket( id ){
           
            document.getElementById("idDetalleVenta").value = id;
            document.getElementById("formActualizar").submit();
              
            
        }
        
        
    </script>
    <script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
    </body>
</html>
