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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
    crossorigin="anonymous">
<link href="assets/CSS/slideNav.css" rel="stylesheet" id="">

        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    </head>
    <body>
 
<section>
    <nav class="navbar navbar-expand  bg-success px-5  sticky-top bg-gradient shadow-lg ">
        <a class="navbar-brand px-5 text-white" href="main.jsp"> <img  width="40" height="40" src="assets/img/Logo_w.png" class="rounded-circle"> RMS AppServices</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-white" id="main"  >Gerson<span class="sr-only"></span></a>
                    </li>

            
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img id="avatar"  width="40" height="40" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                          <a class="dropdown-item" href="userview.jsp" id="userProfile">Editar Perfil</a>
                          <a class="dropdown-item" href="signin.jsp">Cerrar</a>
                        </div>
                    </li>
               </ul>
        </div>
</section>
<section>
    <input type="checkbox" id="menu" />
    <label style="transform: translate(2px,15px);" for="menu" class="menu">
        <span></span>
        <span></span>
        <span></span>
  </label>
  
    <nav class="navSlide">
      
       
      <ul id="nav_action" >
        <li ><a id="inicio" class="menu_inicio" href="/main.jsp" >Inicio<i id="menu-icon" class="fa fa-home right" aria-hidden="true"></i></a></li>
         <li><a id="createRQLink" class="menu_izq" href="RequestCreate.jsp" >Requerimiento<i id="menu-icon" class="fas fa-list-ol right"></i></a></li>
        <li><a id="programa" class="menu_izq" href="#" >Cotizacion<i id="menu-icon" class="fas fa-hand-holding-usd right"></i></a></li>
        <li><a id="turnos" class="menu_izq" href="#" >Informes<i id="menu-icon" class="fas fa-chart-line right"></i></a></li>
        <li><a id="Config" class="menu_izq" href="" >Configuración<i id="menu-icon" class="fa fa-cogs right"></i></a></li>
        </ul>
    </nav>
    </section>
 
        <br>
        <section class="container">
            <form method="GET" action="UserCtrl">
                <h3>Editar Perfil</h3> 
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
                                    <label for="floatingInput">Id Usuario</label><input id="Id" type="text" class="form-control" required="" readonly name="IdUser_PK" value="<%=user.getIdUser_PK()%>" >
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <label for="floatingInput">Empresa</label><input type="text" class="form-control" id="floatingInput"  required="" name="IdCompany_FK"  readonly value="<%=user.getIdCompany_FK()%>" >
                                </div>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Nombre</label><input type="text" class="form-control"   required="" name="UserName"  value="<%=user.getUserName()%>">
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Apellido</label><input type="text" class="form-control" id="floatingInput"  required="" name="UserLastName"  value="<%=user.getUserLastName() %>" >
                        </div>
                        <div class="row"> 
                            <div class="col">
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Correo</label><input type="text" class="form-control" id="floatingInput"  required="" name="UserEmail"  value="<%=user.getUserEmail()%>" >
                        </div><input type="hidden" class="form-control" id="floatingInput"  required="" name="password"  value="<%=user.getPassword()%>" >
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Avatar</label><select class="custom-select custom-select-lg mb-3" id="SelAvatar" name="avatar">
                                                                                            <option selected>seleccione un icono</option>
                                                                                                <option value="woman">mujer</option>
                                                                                                <option value="man">hombre</option>
                                                                                                <option value="cat">gato</option>
                                                                                                <option value="dog">perro</option>
                                                                                                <option value="car">carro</option>
                                                                                                <option value="bicycle">bicicleta</option></select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success" name="btnAccion" value="userUpdate" >Guardar</button></a>
                        <a id="changepsw" href="userupdate.jsp"><button type="button" class="btn btn-primary" name="btnAccion" >Cambiar Contraseña</button></a>
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
        <script type="text/javascript" src="assets/js/jquery.tabletojson.js "></script>
            <script>
                $(document).ready(function() {
                    document.getElementById("avatar").src="assets/img/"+localStorage.getItem("Avatar")+".png"
                    document.getElementById("main").innerHTML=localStorage.getItem("UserName")
                    document.getElementById("userProfile").href="userview.jsp?Id="+localStorage.getItem("IdUser_PK")
                    document.getElementById("createRQLink").href="RequestCreate.jsp?IdUser_FK="+localStorage.getItem("IdUser_PK")+"&IdCompany_FK="+localStorage.getItem("IdCompany_FK")
                    document.getElementById("avatarXL").src="assets/img/"+localStorage.getItem("Avatar")+".png";
                    document.getElementById("changepsw").href="changePSW.jsp?Id="+localStorage.getItem("IdUser_PK")
                    $('select option[value="'+localStorage.getItem("Avatar")+'"]').attr("selected", true);
                    $('#SelAvatar').change(function() {
                    document.getElementById("avatarXL").src="assets/img/"+$('#SelAvatar').val()+".png";
                        
                    });
                    
                }); 
            </script>
    </body>
</html>