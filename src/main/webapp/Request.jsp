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
<script src="https://use.fontawesome.com/d2ef825dba.js"></script>
    <link href="/assets/CSS/calendar.css" rel="stylesheet" id="">

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
           
            <li class="nav-item">
              <a class="nav-link text-white" href="#">Cotización</a>
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
            <form method="GET" action="RequestCtrl">
                <h3>RQ</h3>
                <div class="row">
                    <div class="col">
                        <%
                           
                            String Id=request.getParameter("Id");
                            RequestCtrl RQctrl = new RequestCtrl();
                                                        
                            
                            
                                                    %>
                        <div class="form-floating mb-3">
                            <input id="IdRQ" type="text" class="form-control"  placeholder="ejemplo" name="IdRequerimiento_PK" readonly value="<%=request.getParameter("Id")%>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Usuario </label><input type="text" class="form-control"  placeholder="ejemplo" required="" readonly value="<%%>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Compañia </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo"  required="" readonly value="<%%>" >
                           
                        </div><div class="form-floating mb-3">
                             <label for="floatingInput">Rango de fechas para el servicio</label>
                            <input type="text" class="form-control"   required="" readonly value="<%%>" />
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Descripcion RQ </label>
                            <textarea type="text" class="form-control" id="floatingInput" placeholder="breve descripcion" readonly  required=""  value=""></textarea>
                           
                        </div>
                    </div>
                   
                     
                </div>
                            <br>
                 <div class="row">
                     
                </div>
                      
                <table id="RQDetails" class="table table-striped table-hover">            
                <thead>
                  <tr>
                    <th scope="col">RQ</th>
                    <th scope="col">Id Sucursal</th>
                    <th scope="col">Id Equipo</th>
                    <th scope="col">Solicitud</th>
                    <th scope="col">Estado</th>
                  <th scope="col">Eliminar</th>
                  </tr>
                </thead>
                <tbody id="RQTable">
                </tbody>
                
                </table>
                  <center>
                      <button id="createRQ" class="btn btn-success btnSize" href="RequestCreate.jsp?id=<%=request.getParameter("Id")%>">Editar</button>
                      <button id="cerrar" class="btn btn-danger btnSize"  href="main.jsp" >Cancelar</button>
                     </center>          
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
                    $('#RQTable').on('click','tr td', function(e){
                        if(e.target.innerHTML== "borrar"){
                          $(e.currentTarget).parent().remove();  
                          var table = $('#RQDetails').tableToJSON({
                                    ignoreColumns: [ 1 , 5]
                              });
                        $('#RQJson').val(JSON.stringify(table));
                        }
                    });
                    $('#AddEQ').click((e)=>{
                        e.preventDefault() ;
                        var row = "<tr id='fila'><td>"+$('#IdRQ').val()+"</td><td>"+$('#SelSuc').val()+"</td><td>"+$('#ListEQ').val()+"</td><td>"+$('#TextRQ').val()+"</td><td>Solicitado</td><td><i class='fa fa-trash' style='cursor:pointer;' >borrar</i></td></tr>"
                        $('#TextRQ').val("");
                        $(row).appendTo('#RQTable');
                        var table = $('#RQDetails').tableToJSON({
                                    ignoreColumns: [ 1 , 5]
                              });
                        $('#RQJson').val(JSON.stringify(table));
                    });
                    $('#cerrar').click((e)=>{
                        e.preventDefault() ;
                        window.location.href='main.jsp';
                    });
                    

                    
                    $('#SelSuc').change(function() {
                        $('#ListEQ').empty();
                           
                                                        
                        $.getJSON("/EquiposCtrl?IdSucursal_FK="+ $('#SelSuc').val(), function (data) {
                            
                            $.each(data.DataEQ, function (i, data) {
                                var div_data = "<option value=" + data.IdEquipo_PK + ">" + data.TAG + "</option>";
                                
                                $(div_data).appendTo('#ListEQ');
                            });
                        });
                    });
                });
        </script>
         
    </body>
</html>