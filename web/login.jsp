<%-- 
    Document   : login
    Created on : 24-08-2019, 16:26:11
    Author     : crist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>   
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/signin.css">
    </head>
    <body class="text-center">

        <form class="form-signin" action="UsuarioControl" method="POST">
            <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Porfavor ingrese sus datos</h1>
            <label for="inputEmail" class="sr-only">Nombre</label>
            <input type="text" id="inputEmail" class="form-control" name="email" placeholder="Email" required autofocus><br>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" name="pass" placeholder="Password" required>
            <div class="checkbox mb-3">
                <br>
                <p class="text-danger">${message}</p>
                <br>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
         
        </form>


    </body>
</html>
