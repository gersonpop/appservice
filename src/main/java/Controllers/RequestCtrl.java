/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Calendar;
import Models.Request;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gerson Porras
 */
@WebServlet(name = "RequestCtrl", urlPatterns = {"/RequestCtrl"})
public class RequestCtrl extends HttpServlet {
    Request objRQ = new Request();
    Calendar userCal = new Calendar();
    
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String accion = request.getParameter("btnAccion");
            if(accion.equals("CreateRQ")){
                objRQ.setIdRequerimiento_PK(Integer.parseInt(request.getParameter("IdRequerimiento_PK")));
                objRQ.setIdUser_FK(request.getParameter("IdUser_FK"));
                objRQ.setIdCompany_FK(request.getParameter("IdCompany_FK"));
                String fecha = request.getParameter("datefilter");
                String RQJSon = request.getParameter("RQJson");
                objRQ.setRQDescripcion(request.getParameter("RQDescripcion"));
                objRQ.setFecha_inicio_req(fecha.substring(0, 10));
                objRQ.setFecha_fin_req(fecha.substring(13, 23));
                
                 System.out.println("El parametro de descripcion es: "+ request.getParameter("RQDescripcion"));
                objRQ.setEstado("Solicitado");
                
                
                if(RQJSon.equals("") || RQJSon.equals("[]") ){
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Por favor incluir lo equipos a inspeccionar '); "+
                                 "window.history.back(); "+
                                 "</script></body></html>";
                        
                    out.println(mensaje);
                }else{
                    if(objRQ.UpdateCliente()){
                        userCal.setTitle(objRQ.getRQDescripcion());
                        userCal.setStart(objRQ.getFecha_inicio_req());
                        userCal.setEnd(objRQ.getFecha_fin_req());
                        userCal.setIdUser_FK(objRQ.getIdUser_FK());
                        userCal.setTipo_Documento("requerimiento");
                        userCal.setId_documento(objRQ.getIdRequerimiento_PK());
                        userCal.setEstado("Solicitado");
                        userCal.setClassName("Solicitado");
                        userCal.setUrl("Request.jsp?IdRequerimiento_PK="+ objRQ.getIdRequerimiento_PK());
                        userCal.InsertDate();
                        String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('RQ "+ request.getParameter("IdRequerimiento_PK") +" Creada correctamente'); "+
                                 "window.location.href='main.jsp'; "+
                                 "</script></body></html>";
                        
                        out.println(mensaje);
                    }
                    else{
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Error al crear la RQ, verifique los datos e intentelo de nuevo'); "+
                                 "window.history.back(); "+
                                 "</script></body></html>";
                        
                        out.println(mensaje);
                    }
                }
            }
        }catch(Exception e){
            System.out.println("Error Controlador " + e);
        }
        
    }

    
    public String CreateRQ(String IdUser_FK, String IdCompany_FK){
        objRQ.setIdCompany_FK(IdCompany_FK);
        objRQ.setIdUser_FK(IdUser_FK);
         objRQ.DeleteTemp();
        if(objRQ.Create()){
            return objRQ.lastRqCreated();
        }
    
        return "err" ;
        
    
           
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
