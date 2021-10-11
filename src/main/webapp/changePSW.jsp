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
             <form action="UserCtrl" method="POST">
                <h3>Cambiar Contraseña</h3> 
                 <%
                           
                            String IdUser_FK=request.getParameter("Id");
                            UserCtrl userctrl = new UserCtrl();
                            User user = userctrl.show(IdUser_FK);                           
                                                    %>
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4">
                        
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Contraseña Actual</label><input type="password" class="form-control" name="oldpsw"  required=""  value="">
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Contraseña Nueva</label><input type="password" class="form-control" name="newpsw"  required=""  value="" >
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Repetir Contraseña</label><input type="password" class="form-control" name="confirmpsw"  required=""  value="" >
                        </div>
                        <input type="hidden" class="form-control" id="floatingInput"  required="" readonly  name="IdUser_PK" value="<%=user.getIdUser_PK()%>" >
                        <button type="submit" class="btn btn-success" name="btnAccion" value="changepsw">Cambiar</button>
                        <a href="main.jsp"><button type="button" class="btn btn-danger" name="btn">Cancelar</button></a>
                    </div>
                </div>
            </form>
        </section>
                        <script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        
            <script>
                $(document).ready(function() {
                document.getElementById("avatar").src="assets/img/"+localStorage.getItem("Avatar")+".png"
                    document.getElementById("main").innerHTML=localStorage.getItem("UserName")
                    document.getElementById("userProfile").href="userview.jsp?Id="+localStorage.getItem("IdUser_PK")
                    document.getElementById("createRQLink").href="RequestCreate.jsp?IdUser_FK="+localStorage.getItem("IdUser_PK")+"&IdCompany_FK="+localStorage.getItem("IdCompany_FK")
                    }); 
            </script>
    </body>
</html>