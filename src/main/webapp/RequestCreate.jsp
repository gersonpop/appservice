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
    <link href="assets/CSS/calendar.css" rel="stylesheet" id="">
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
        <li><a id="Config" class="menu_izq" href="" >Configuraci??n<i id="menu-icon" class="fa fa-cogs right"></i></a></li>
        </ul>
    </nav>
    </section>
 
        <br>
        

        
        <section class="container">
            <form method="POST" action="RequestCtrl">
                <h3>Crear RQ</h3>
                <div class="row">
                    <div class="col-5">
                        <%
                           
                            String IdUser_FK=request.getParameter("IdUser_FK");
                            String IdCompany_FK=request.getParameter("IdCompany_FK");
                            RequestCtrl RQctrl = new RequestCtrl();
                                                        
                            
                            
                                                    %>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">RQ </label><input id="IdRQ" type="text" class="form-control"  placeholder="ejemplo" name="IdRequerimiento_PK" readonly value="<%=RQctrl.CreateRQ(IdUser_FK, IdCompany_FK) %>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Usuario </label><input type="text" class="form-control"  placeholder="ejemplo" name="IdUser_FK" required="" readonly value="<%=IdUser_FK%>">
                           
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Id Compa??ia </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="IdCompany_FK" required="" readonly value="<%=IdCompany_FK%>" >
                           
                        </div><div class="form-floating mb-3">
                             <label for="floatingInput">Rango de fechas para el servicio</label>
                            <input type="text" name="datefilter" required="" value="" />
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Descripcion RQ </label>
                            <textarea type="text" class="form-control" id="floatingInput" placeholder="breve descripcion" name="RQDescripcion" required=""  value=""></textarea>
                           
                        </div>
                    </div>
                    <div class="col-7">
                        <br>
                        <div class="card p-4">
                        <label>Sucursal/Campo : </label>
                        <select id="SelSuc" class="form-select"  aria-label="multiple select example"  >
                            <option value="1" >Seleccione una sucursal</option>
                            <option value="1" >Campo la cira</option>
                            <option value="2">Campo Casabe</option>
                           
                        </select>
                        <label>Equipo: </label>
                        <select id="ListEQ" class="form-select"  aria-label="multiple select example"  >
                             <option value="1" >Selecciones un equipo</option>

                        </select>
                        <br>
                        <label for="floatingInput">Que requiere el equipo?</label>
                            <textarea id="TextRQ" type="text" class="form-control" id="floatingInput" rows="5" placeholder="especifique el monitoreo "  value=""></textarea>
                          <center>
                         <button id="AddEQ" class="btn btn-success btnSize" >Agregar Equipos</button>
                         </center> 
                        </div> <input type="hidden"  id ="RQJson" name="RQJson" value="" />      
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
                         <button id="createRQ" class="btn btn-success btnSize" name="btnAccion" value="CreateRQ">Crear RQ</button>
                      <button id="cerrar" class="btn btn-danger btnSize"  href="main" >Cancelar</button>
                     </center>          
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
                    $('input[name="datefilter"]').daterangepicker({
                        autoUpdateInput: false,
                        locale: {
                            cancelLabel: 'Clear'
                        }
                    });

                    $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
                        $(this).val(picker.startDate.format('YYYY-MM-DD') + ' / ' + picker.endDate.format('YYYY-MM-DD'));
                    });

                    $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
                        $(this).val('');
                    });


                    document.getElementById("avatar").src="assets/img/"+localStorage.getItem("Avatar")+".png";
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
                                    ignoreColumns: [  5]
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