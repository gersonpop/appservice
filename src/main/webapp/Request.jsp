<%-- 
    Document   : index
    Created on : 28/09/2021, 08:17:19 PM
    Author     : Gerson Porras
--%>

<%@page import="Models.RQDetails"%>
<%@page import="Models.Request"%>
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
            
                <h3>RQ</h3>
                <div class="row">
                    
                        <%
                           
                            String Id=request.getParameter("Id");
                            RequestCtrl RQctrl = new RequestCtrl();
                            Request RQ = RQctrl.getRQbyID(Id);
                            
                            
                            
                                                    %>
                        <div class="form-floating mb-3 col-1">
                            <label for="floatingInput">RQ </label><input id="IdRQ" type="text" class="form-control"  placeholder="ejemplo" name="IdRequerimiento_PK" readonly value="<%=RQ.getIdRequerimiento_PK()%>">
                           
                        </div>
                        <div class="form-floating  col-2" >
                            <label for="floatingInput">Id Usuario </label><input type="text" class="form-control"  placeholder="ejemplo" required="" readonly value="<%=RQ.getIdUser_FK()%>">
                           
                        </div>
                        <div class="form-floating  col-2">
                            <label for="floatingInput">Id Compa??ia </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo"  required="" readonly value="<%=RQ.getIdCompany_FK()%>" >
                           
                        </div>
                        <div class="form-floating  col-2">
                            <label for="floatingInput">Estado </label><input type="text" class="form-control" id="Estado" placeholder="ejemplo"  required="" readonly value="<%=RQ.getEstado()%>" >
                           
                        </div>
                            <div class="form-floating  col-2">
                            <label for="floatingInput">Fecha Solicitud </label><input type="text" class="form-control" id="FechaSol" placeholder="ejemplo"  required="" readonly value="<%=RQ.getFecha_Solicitud() %>" >
                           
                        </div>
                        <div class="form-floating col-3">
                             <label for="floatingInput">Rechas de servicio</label>
                            <input type="text" class="form-control"   required="" readonly value="<%=RQ.getFecha_inicio_req() + " / " + RQ.getFecha_fin_req() %>" />
                        </div>
                        
                                       
                     
                </div>
                <div class="row">
                    
                       
                        <div class="form-floating mb-3 col-2">
                            <label for="floatingInput">Fecha Cotizacion </label><input id="IdRQ" type="text" class="form-control"  placeholder="ejemplo" name="IdRequerimiento_PK" readonly value="<%=RQ.getFecha_Cotizacion() %>">
                           
                        </div>
                        <div class="form-floating  col-2" >
                            <label for="floatingInput">F. Aprov. Cot </label><input type="text" class="form-control"  placeholder="ejemplo" required="" readonly value="<%=RQ.getFecha_Aprov_Cot() %>">
                           
                        </div>
                        <div class="form-floating  col-2">
                            <label for="floatingInput">F. Ejec. OT </label><input type="text" class="form-control" id="floatingInput" placeholder="ejemplo"  required="" readonly value="<%=RQ.getFecha_Ejec_Ord_Serv() %>" >
                           
                        </div>
                        <div class="form-floating  col-2">
                            <label for="floatingInput">F. Informe </label><input type="text" class="form-control" id="Estado" placeholder="ejemplo"  required="" readonly value="<%=RQ.getFecha_Informe() %>" >
                           
                        </div>
                            <div class="form-floating  col-2">
                            <label for="floatingInput">F. Encuest. Satisf </label><input type="text" class="form-control" id="FechaSol" placeholder="ejemplo"  required="" readonly value="<%=RQ.getFecha_Encuesta() %>" >
                           
                        </div>
                        <div class="form-floating col-2">
                             <label for="floatingInput">Id Enc. Satisfacci??n</label>
                             <input type="text" class="form-control"   required="" readonly value="<%=RQ.getIdEncuestasSatisf() %>" />
                        </div>
                        
                    <div class="col">
                        <div class="form-floating mb-3">
                            <label for="floatingInput">Descripcion RQ </label>
                            <textarea type="text" class="form-control" id="floatingInput" placeholder="breve descripcion" readonly  required=""  value=""><%=RQ.getRQDescripcion() %></textarea>
                           
                        </div>
                    </div>
                   
                     
                </div>
                            <br>
                 <div class="row">
                     
                </div>
                      
                <table id="RQDetails" class="table table-striped table-hover">            
                <thead>
                  <tr>
                    <th scope="col">Item</th>
                    <th scope="col">RQ</th>
                    <th scope="col">Id Sucursal</th>
                    <th scope="col">Id Equipo</th>
                    <th scope="col">Solicitud</th>
                    <th scope="col">Estado</th>
                  </tr>
                </thead>
                    <tbody id="RQTable">
                    <% 
                       try{
                        ArrayList<RQDetails> listaDetallesRQ = new ArrayList<>(); 
                        RequestCtrl RequestCtr = new RequestCtrl(); 
                        listaDetallesRQ = RequestCtr.getRQDestails(RQ.getIdRequerimiento_PK()); 
                        for(int i=0; i<listaDetallesRQ.size();i++){
                    %>
                        <tr>
                            <th scope="row"><%=listaDetallesRQ.get(i).getIdDeralleRQ_PK() %></th>
                            <td><%=listaDetallesRQ.get(i).getIdRequerimiento_FK() %></td>
                            <td><%=listaDetallesRQ.get(i).getIdSucursal_FK() %></td>
                            <td><%=listaDetallesRQ.get(i).getIdEquipo_FK() %></td>
                            <td><%=listaDetallesRQ.get(i).getDescripcion_RQ() %></td>
                            <td><%=listaDetallesRQ.get(i).getEstado()%></td>
                        </tr>
                    <%}
                    }catch(Exception e){
                      System.out.println("error index " + e);
                     }
                    %>
                    </tbody>
                </table>
                <center>
                    <a href="RequestUpdate.jsp?Id=<%=request.getParameter("Id")%>"><button id="createRQ" class="btn btn-success btnSize" >Editar</button></a>
                      <button id="cerrar" class="btn btn-danger btnSize"  href="main.jsp" >Cancelar</button>
                </center>          
            
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