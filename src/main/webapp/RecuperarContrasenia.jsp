<%-- 
    Document   : RecuperarContrasenia
    Created on : 28/09/2021, 08:20:44 PM
    Author     : Gerson Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <div class="container">
        <div class="p-3 mb-2 bg-light text-dark">
            <div class="row">
                <div class="col-4"><h2>Imagen</h2></div>
                <div class="col-8"><h1 class="text-center">Recuperar Contraseña</h1></div>
            </div>
        </div>
    </div>

</head>
<body>

    <div class="container">
        <div class="p-3 mb-2 bg-success text-white">
            <div class="row">
                <div class="col-5"><h2>Imagen</h2></div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <h3 class="text-end">ID:</h3>
                        </div>
                        <div class="col-8">
                            <form>
                                <div class="mb-3">
                                      <input type="text" class="form-control">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">  
                        <div class="col-4">
                            <h3 class="text-end">Correo*:</h3>
                        </div>
                        <div class="col-8">
                            <form>                           
                                <div class="mb-3">

                                     <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>     
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="row">
                    <div class="col-8"></div>
                    <div class="col-1">
                        <button type="button" class="btn btn-light">Enviar</button>
                    </div>

                    <div class="col-3"></div>
                </div>           
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>

