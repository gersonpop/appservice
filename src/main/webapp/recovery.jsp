<%-- 
    Document   : recovery
    Created on : 29/09/2021, 10:25:08 PM
    Author     : LilianaPatricia
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
                <form action="javascript:void(0);" method="get">

                      <fieldset class="clearfix">

                        <p ><span class="fa fa-user"></span><input type="text" name="IdUser_PK" Placeholder="Id usuario" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                        <p><span class="fa fa-at"></span><input type="text" name="UserEmail" Placeholder="Correo electrónico" required></p> <!-- JS because of IE support; better: placeholder="Password" -->

                         <div>
                                            <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="signin.jsp">Iniciar Sesión</a></span>
                                            <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value="Recuperar"></span>
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

