<%@page import="Controllers.UserCtrl"%>
<%@page import="Models.User"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>AppService</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/d2ef825dba.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    </head>
    <body>
        <section>
            <nav class="navbar navbar-expand-lg  bg-success  bg-gradient shadow-lg">
                <a class="navbar-brand  text-white" href="#">RMS AppServices</a> 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-white" href="main.jsp">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img id="avatar"  width="40" height="40" class="rounded-circle">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="userupdate" id="userEditar">Editar Perfil</a>
                                <a class="dropdown-item" href="signin.jsp">Cerrar</a>
                            </div>
                        </li>
                    </ul>
                </div>
        </section>
        <br>
        <section class="container">
            <form method="GET" action="UserCtrl">
                <h3>MI PERFIL</h3> 
                 <%
                           
                            String IdUser_FK=request.getParameter("Id");
                            UserCtrl userctrl = new UserCtrl();
                            User user = userctrl.show(IdUser_FK);                           
                                                    %>
                <div class="row">
                    <div class="col">
                        <a>
                            <img id="avatarXL"  width="400" height="400" class="rounded-circle">
                        </a>                        
                    </div>
                    <div class="col">
                     <div class="col">
                        <div class="row"> 
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <label for="floatingInput">Id Usuario</label><input id="Id" type="text" class="form-control" required="" readonly value="<%=user.getIdUser_PK()%>" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <label for="floatingInput">Empresa</label><input type="text" class="form-control" id="floatingInput"  required="" readonly value="<%=user.getIdCompany_FK()%>" >
                                </div>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Nombre</label><input type="text" class="form-control"   required="" readonly value="<%=user.getUserName()%>">
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Apellido</label><input type="text" class="form-control" id="floatingInput"  required="" readonly value="<%=user.getUserLastName() %>" >
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Correo</label><input type="text" class="form-control" id="floatingInput"  required="" readonly value="<%=user.getUserEmail()%>" >
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Avatar</label><input type="text" class="form-control" id="floatingInput"  required="" readonly value="<%=user.getAvatar()%>" >
                        </div>
                        <a href="userupdate.jsp"><button type="button" class="btn btn-success" name="btnAccion" id="userUpdate">Actualizar</button></a>
                        <a href="main.jsp"><button type="button" class="btn btn-danger" name="btnAccion">Cancelar</button></a>
                    </div>
                </div>
            </form>
        </section>
                        <script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <script type="text/javascript" src="/assets/js/jquery.tabletojson.js "></script>
            <script>
                $(document).ready(function() {
                    document.getElementById("avatar").src="/assets/img/"+localStorage.getItem("Avatar")+".png";
                    document.getElementById("avatarXL").src="/assets/img/"+localStorage.getItem("Avatar")+".png";
                    document.getElementById("userEditar").href="userview.jsp?Id="+localStorage.getItem("IdUser_PK")
                    document.getElementById("userUpdate").href="userupdate.jsp?Id="+localStorage.getItem("IdUser_PK")
                });
            </script>
    </body>
</html>