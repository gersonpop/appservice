<%-- 
    Document   : signup
    Created on : 30/09/2021, 12:36:28 PM
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

                        <p style="display: flex"><span  class="fa fa-pencil-square-o"></span> <input style="margin-right: 5px" type="text" name="UserName" Placeholder="Nombre" required> 
                        <span class="fa fa-pencil-square-o"></span><input type="text" name="UserLastName" Placeholder="Apellido" required></p> 
                        <p style="display: flex"><span class="fa fa-user"></span><input  style="margin-right: 5px" type="text" name="IdUser_PK" Placeholder="Doc. Identidad" required>
                        <span class="fa fa-at"></span><input type="text" name="UserEmail" Placeholder="e-mail" required></p> 
                        <p style="display: flex"><select class="form-select" name="IdCompany_FK">
                                                                                            <option selected="">Seleccione la empresa</option>
                                                <% 
                                                ArrayList<Company> listCompany = new ArrayList<>(); 
                                                CompanyCtrl ctrCompany = new CompanyCtrl(); 
                                                listCompany = ctrCompany.list(); 
                        
                                                for(int i=0; i<listCompany.size();i++){
                                                %>
                                                <option value="<%=listCompany.get(i).getIdEmpresa_PK()%>"><%=listCompany.get(i).getRazon_Social()%></option>
                                                <%}%>                                                          
                                                </select>           
                        <select class="custom-select custom-select-lg mb-3" name="avatar">
                                                                                            <option selected>seleccione un icono</option>
                                                                                                <option data-content="<i class='fa fa-cutlery' ></i>"  value="woman"></i>">mujer</option>
                                                                                                <option data-content="<i class='fa fa-eye'></i>" value="men"></i>">hombre</option>
                                                                                                <option data-content="<i class='fa fa-heart-o'></i>" value="<i class="cat"></i>">gato</option>
                                                                                                <option data-content="<i class='fa fa-leaf'></i>" value="<i class="dog"></i>">perro</option>
                                                                                                <option data-content="<i class='fa fa-music'></i>" value="<i class="car"></i>">carro</option>
                                                                                                <option data-content="<i class='fa fa-star'></i>" value="<i class="bicycle"></i>">bicicleta</option>
                                                                                            </select></p>             
                                                                                        
                                                                                                                                                            
               
           
                        <div>
                            <span style="width:49%; text-align:left;  display: inline-block;"><a class="small-text" href="signin.jsp">iniciar sesión</a></span>
                            <span style="width:49%; text-align:right;  display: inline-block;"><input type="submit" name="btnAccion" value="signup"></span>
                            
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
