<%-- 
    Document   : changePSW.jsp
    Created on : 9/10/2021, 04:55:27 PM
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

                        <p ><span class="fa fa-lock"></span><input type="password" name="Password" Placeholder="contraseña actual" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                        <p ><span class="fa fa-lock"></span><input type="password" name="Password" Placeholder="nueva contraseña" required></p><!-- JS because of IE support; better: placeholder="Password" -->
                        <p ><span class="fa fa-lock"></span><input type="password" name="Password" Placeholder="reingrese contraseña " required></p>
                         <div>
                                            <span style="width:58%; text-align:left;  display: inline-block;"><a class="small-text" href="recovery.jsp">Recordar contraseña</a></span>
                                            <span style="width:40%; text-align: right;  display: inline-block;"><input type="submit" name="btnAccion" value="SAVE"></span>
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

