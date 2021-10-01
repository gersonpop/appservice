<%-- 
    Document   : index
    Created on : 28/09/2021, 08:17:19 PM
    Author     : Gerson Porras
--%>

<%@page import="Models.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controllers.ControlProducto"%>
<
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crud Web MinTic</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/estilos/estilos.css" rel="stylesheet" type="text/css"/>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 
    </head>
    <body>
    <center>
        <a href="signin.jsp"><button class="btn btn-outline-success">Login</button></a>
         <a href="main.jsp"><button class="btn btn-outline-success">Main</button></a>
              </center>          
        <header>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h1>CRUD WEB Misión TIC 2021 JSP + JAVA + BOOTSTRAP</h1>
            </div>
        </header>
        
        <section class="container">
            <form method="POST" action="ControlProducto">
                <h3>Actualizar Productos</h3>
                <div class="row">
                    <div class="col">
                        <%
                            String CodigoStr = request.getParameter("codigoProducto");
                            int codigo = Integer.parseInt(CodigoStr.toString());
                            ControlProducto ctrProducto = new ControlProducto();
                            ArrayList<Producto> consultaProducto = new ArrayList();
                            consultaProducto = ctrProducto.consultar(codigo);                        %>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="codigoProducto" readonly value="<% out.println(consultaProducto.get(0).getCodigoProducto()); %>">
                           <label for="floatingInput">Codigo: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="nombreProducto" required=""  value="<% out.println(consultaProducto.get(0).getNombreProducto()); %>">
                           <label for="floatingInput">Nombre: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="cantidadProducto" required=""  value="<% out.println(consultaProducto.get(0).getCantidadProducto()); %>" >
                           <label for="floatingInput">Cantidad: </label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="precioProducto" required=""  value="<% out.println(consultaProducto.get(0).getPrecioProducto()); %>">
                           <label for="floatingInput">Precio: </label>
                        </div>
                        <label>Categoria: </label>
                        <select class="form-select" multiple aria-label="multiple select example" name="categoriaProducto" >
                            <option value="Lacteos" >Lacteos</option>
                            <option value="Viveres">Viveres</option>
                            <option value="Abarrotes">Abarrotes</option>
                            <option value="Aseo">Aseo</option>
                            <option value="Carnicos">Carnicos</option>
                         </select>
                    </div>
                </div>
                 <div class="row">
                     <center>
                         <button class="btn btn-success btnSize" name="btnAccion" value="Actualizar">Actualizar Producto</button>
                     </center>
                </div>
            </form>
        </section>
        
      
        <footer>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h5>Grupo X S46, Mision TIC 2021, Todos los derechos reservados</h5>
            </div>
        </footer>
        
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>