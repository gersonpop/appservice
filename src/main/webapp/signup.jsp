<%-- 
    Document   : signup
    Created on : 30/09/2021, 12:36:28 PM
    Author     : carolina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="/assets/CSS/login.css">
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

                        <p><span class="fa fa-pencil-square-o"></span><input type="text" name="UserName" Placeholder="Nombre" required></p> 
                        <p><span class="fa fa-pencil-square-o"></span><input type="text" name="UserLastName" Placeholder="Apellido" required></p> 
                        <p><span class="fa fa-user"></span><input type="text" name="IdUser_PK" Placeholder="Doc. Identidad" required></p> 
                        <p><span class="fa fa-at"></span><input type="text" name="UserEmail" Placeholder="e-mail" required></p> 
                        <p><span class="fa fa-at"></span><input type="text" name="UserEmail" Placeholder="e-mail" required></p> 
                        <p><select class="custom-select custom-select-lg mb-3">
                                                                                            <option selected>seleccione la empresa</option>
                                                                                            <option value="1">One</option>
                                                                                            <option value="2">Two</option>
                                                                                            <option value="3">Three</option>
                                                                                        </select></p>             
                        <p><select class="custom-select custom-select-lg mb-3">
                                                                                            <option selected>seleccione una avatar</option>
                                                                                            <option value="1">One</option>
                                                                                            <option value="2">Two</option>
                                                                                            <option value="3">Three</option>
                                                                                        </select></p>             
                        

                        <div>
                            <span style="width:40%; text-align:right;  display: inline-block;"><input type="submit" name="btnAccion" value="signup"></span>
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
