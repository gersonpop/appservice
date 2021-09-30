<%-- 
    Document   : index
    Created on : 28/09/2021, 08:17:19 PM
    Author     : Gerson Porras
--%>

<%@page import="Controllers.ControlProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Producto"%>
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
        <header>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h1>CRUD WEB Misión TIC 2021 JSP + JAVA + BOOTSTRAP</h1>
            </div>
        </header>
        
        <section class="container">
            <form method="POST" action="ControlProducto">
                <h3>Gestión de productos</h3>
                <div class="row">
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="codigoProducto" required="">
                           <label for="floatingInput">Codigo: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ejemplo" name="nombreProducto" required="">
                           <label for="floatingInput">Nombre: </label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="cantidadProducto" required="">
                           <label for="floatingInput">Cantidad: </label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="floatingInput" placeholder="ejemplo" name="precioProducto" required="">
                           <label for="floatingInput">Precio: </label>
                        </div>
                        <label>Categoria: </label>
                        <select class="form-select" multiple aria-label="multiple select example" name="categoriaProducto">
                            <option value="Lacteos">Lacteos</option>
                            <option value="Viveres">Viveres</option>
                            <option value="Abarrotes">Abarrotes</option>
                            <option value="Aseo">Aseo</option>
                            <option value="Carnicos">Carnicos</option>
                         </select>
                    </div>
                </div>
                 <div class="row">
                     <center>
                         <button class="btn btn-success btnSize" name="btnAccion" value="Insertar">Insertar Producto</button>
                     </center>
                </div>
            </form>
        </section>
        
        <section class="container">
            <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th scope="col">Codigo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Categoria</th>
                    <th scope="col">Acción</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                       try{
                           
                       
                        
                        
                        ArrayList<Producto> listaProducto = new ArrayList<>(); 
                        ControlProducto ctrProducto = new ControlProducto(); 
                        listaProducto = ctrProducto.listar(); 
                        
                        for(int i=0; i<listaProducto.size();i++){
                    %>
          <tr>
                   <th scope="row"><%=listaProducto.get(i).getCodigoProducto()%></th>
                    <td><%=listaProducto.get(i).getNombreProducto()%></td>
                    <td><%=listaProducto.get(i).getCantidadProducto()%></td>
                    <td><%=listaProducto.get(i).getPrecioProducto()%></td>
                    <td><%=listaProducto.get(i).getCategoriaProducto()%></td>
                    <td>
                        <a href="actualizar.jsp?codigoProducto=<%=listaProducto.get(i).getCodigoProducto()%>"><button class="btn btn-outline-success">Actualizar</button></a>
                        <a href="ControlProducto?codigoProducto=<%=listaProducto.get(i).getCodigoProducto()%>"><button class="btn btn-danger"> Eliminar </button></a>
                    </td>
                  </tr>
                  <%}
                  }catch(Exception e){
                    System.out.println("error index " + e);
                    
                   }
                  %>
                </tbody>
              </table>
        </section>
        
        <footer>
            <div class="container bg-success text-center bg-opacity-25 margen" >
                <h5>Grupo X S46, Mision TIC 2021, Todos los derechos reservados</h5>
            </div>
        </footer>
        
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>