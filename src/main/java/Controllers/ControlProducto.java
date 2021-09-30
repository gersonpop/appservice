/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gerson Porras
 */
@WebServlet(name = "ControlProducto", urlPatterns = {"/ControlProducto"})
public class ControlProducto extends HttpServlet {
Producto objProducto = new Producto();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("btnAccion");
            if(accion.equals("Insertar")){
                int codigoProducto = Integer.parseInt(request.getParameter("codigoProducto"));
                String nombreProducto = request.getParameter("nombreProducto");
                int cantidadProducto = Integer.parseInt(request.getParameter("cantidadProducto"));
                int precioProducto = Integer.parseInt(request.getParameter("precioProducto"));
                String categoriaProducto = request.getParameter("categoriaProducto");
                
                objProducto.setCodigoProducto(codigoProducto);
                objProducto.setNombreProducto(nombreProducto);
                objProducto.setCantidadProducto(cantidadProducto);
                objProducto.setPrecioProducto(precioProducto);
                
                objProducto.setCategoriaProducto(categoriaProducto);
                
                objProducto.crearProducto();
                
                String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Producto insertado correctamente'); "+
                                 "window.location.href='index.jsp'; "+
                                 "</script></body></html>";
                        
                        out.println(mensaje);
            }
        }catch(Exception e){
            System.out.println("Error Controlador " + e);
        }
    }
   public ArrayList listar(){
        try {
            ResultSet consulta = objProducto.listarProducto(); 
            ArrayList<Producto> listaProducto = new ArrayList<>(); 
            
            while(consulta.next()){
                objProducto = new Producto(); 
                objProducto.setCodigoProducto(consulta.getInt(1));
                objProducto.setNombreProducto(consulta.getString(2));
                objProducto.setCantidadProducto(consulta.getInt(3));
                objProducto.setPrecioProducto(consulta.getInt(4));
                objProducto.setCategoriaProducto(consulta.getString(5));
                listaProducto.add(objProducto); 
                
            }
            
            return listaProducto; 
            
        } catch (Exception error) {
            System.out.println("Error Controlador: " + error);
        }
 
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
