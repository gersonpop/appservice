<%-- 
    Document   : update
    Created on : 7/10/2021, 12:47:35 PM
    Author     : carolina
--%>


<%@page import="Controllers.CompanyCtrl"%>
<%@page import="Models.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="/assets/CSS/register.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="main">
    
    
    <div class="container">
    <center>
        <div class="middle">
            <div id="login">
                <form action="UserCtrl" method="POST">

                      <fieldset class="clearfix">

                        <p style="display: flex"><span  class="fa fa-ellipsis-h"></span> <input style="margin-right: 5px" type="text" name="idEmpresa" Placeholder="idEmpresa" required> 
                        <span class="fa fa-pencil-square-o"></span><input type="text" name="RazonSocial" Placeholder="Razon Social" required></p> 
                        <p style="display: flex"><span class="fa fa-user"></span><input  style="margin-right: 5px" type="text" name="RepresentanteLegal" Placeholder="Representante Legal" required>
                        <span class="fa fa-signal"></span><input type="text" name="ActividadEconomica" Placeholder="ActividadEconomica" required> 
                        <p style="display: flex"><span class="fa fa-user"></span><input  style="margin-right: 5px" type="text" name="Persona Contacto" Placeholder="Persona Contacto" required>
                        <span class="fa fa-phone"></span><input type="text" name="Telefono Contacto" Placeholder="Telefono Contacto" required></p>               
                        <p style="display: flex"><select class="custom-select custom-select-lg mb-3" name="Status">
                                                                                            <option selected="">Seleccione estado</option>                        
                                                                                            <option value="Activo">Activo</option>
                                                                                            <option value="Inactivo">Inactivo</option>
                        </select></p>             
                                                                                                                                                                                                
                  
                        <div>
                            <span style="width:49%; text-align:left;  display: inline-block;"><a class="small-text" href="signup.jsp">registro</a></span>
                            <span style="width:49%; text-align:right;  display: inline-block;"><input type="submit" name="btnAccion" value="update"></span>
                            
                        </div>

                  </fieldset>
                    <div class="clearfix"></div>
                </form>

                <div class="clearfix"></div>

              </div> <!-- end login -->
              <div class="logo">
                    <img class="img_logo" src="/assets/img/Logo_w.png">
                  <div class="clearfix"></div>
              </div>

              
              
              </div>
        </center>
            </div>

        </div>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </body>
</html>

