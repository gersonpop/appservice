<%-- 
    Document   : index
    Created on : 28/09/2021, 08:17:19 PM
    Author     : Gerson Porras
--%>

<%@page import="Controllers.RequestCtrl"%>
<%@page import="Models.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.ControlProducto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AppService</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="/assets/CSS/calendar.css" rel="stylesheet" id="">

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

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
           
            <li class="nav-item">
              <a class="nav-link text-white" href="#">Cotizacoin</a>
            </li>
            
             
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img id="avatar"  width="40" height="40" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                          <a class="dropdown-item" href="main.jsp">Dashboard</a>
                          <a class="dropdown-item" href="#">Editar Perfil</a>
                          <a class="dropdown-item" href="signin.jsp">Cerrar</a>
                        </div>
                      </li>
                
                
                
               </ul>
        </div>
</section>


        <br>
        

        
        <section class="container">
            <form method="POST" action="ControlProducto">
                <h3>Crear RQ</h3>
                <div class="row">
                    <div class="col">
                        <%
                           
                            String IdUser_FK=request.getParameter("IdUser_FK");
                            String IdCompany_FK=request.getParameter("IdCompany_FK");
                            RequestCtrl RQctrl = new RequestCtrl();
                                                        
                            
                            
                                                    %>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">RQ </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="IdRequerimiento_PK" readonly value="<%=RQctrl.CreateRQ(IdUser_FK, IdCompany_FK) %>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Usuario </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="IdUser_FK" required="" readonly value="<%=IdUser_FK%>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Compañia </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="IdCompany_FK" required="" readonly value="<%=IdCompany_FK%>" >
                           
                        </div>
                    </div>
                            
                            
                                
                    <div class="col"><div class="form-floating mb-3">
                            <label for="floatingInput">Fecha inicio </label>
                            <input tipe="date" data-provide="datepicker" placeholder="AAAA-MM-DD">
                             <label for="floatingInput">Fecha fin </label>
                            <input tipe="date" data-provide="datepicker" placeholder="AAAA-MM-DD">
                        
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Descripcion RQ </label>
                            <textarea type="text" class="form-control" id="floatingInput" placeholder="breve descripcion" name="precioProducto" required=""  value=""></textarea>
                           
                        </div>
                        <label>Sucursal: </label>
                        <select class="form-select"  aria-label="multiple select example" name="categoriaProducto" >
                            <option value="Lacteos" >Campo la cira</option>
                            <option value="Viveres">Campo Casabe</option>
                            
                         </select>
                        
                        <label>Equipo: </label>
                        
                        <select class="form-select"  aria-label="multiple select example" name="categoriaProducto" >
                            <option value="Lacteos" >Bomba p-110A</option>
                            <option value="Viveres">Bomba p-110B</option>
                            <option value="Abarrotes">Bomba p-110C</option>

                        </select>
                        <br>
                        <label for="floatingInput">Que requiere el equipo?</label>
                            <textarea type="text" class="form-control" id="floatingInput" placeholder="especifique el monitoreo " name="precioProducto" required=""  value=""></textarea>
                          <center>
                         <button class="btn btn-success btnSize" name="btnAccion" value="agregar">Agregar Equipos</button>
                     </center> 
                    </div>
                     
                </div>
                 <div class="row">
                     
                </div>
                            
                <table class="table table-striped table-hover">            
                <thead>
                  <tr>
                    <th scope="col">Id Sucursal</th>
                    <th scope="col">Id Equipo</th>
                    <th scope="col">TAG</th>
                    <th scope="col">Solicitud</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
                
                </table>
                  <center>
                         <button class="btn btn-success btnSize" name="btnAccion" value="Crear">Crear RQ</button>
                     </center>          
            </form>
        </section>
        
      

       
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script>
                
                $(document).ready(function() {
                    
                    console.log("estamos en plena creacion de RQ");
                  // 
                   document.getElementById("avatar").src="/assets/img/"+localStorage.getItem("Avatar")+".png";

        </script>
    </body>
</html>