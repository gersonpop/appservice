/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gerson Porras
 */
public class UserCtrl extends HttpServlet {
    User objUser = new User(); 
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
            if(accion.equals("signin")){
                String IdUser_PK = request.getParameter("IdUser_PK");
                String Password = request.getParameter("Password");
                
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setPassword(Password);
                
                
                if(objUser.authUser()){
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "window.location.href='main.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
                else{
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('usuario o contraseña incorrecto'); "+
                                 "window.location.href='signin.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
            }
            else if(accion.equals("signup")){
               String IdUser_PK = request.getParameter("IdUser_PK");
               String UserEmail = request.getParameter("UserEmail");
                String userName= request.getParameter("UserName");
                String userLastName= request.getParameter("UserLastName");
                String idCompany_FK = request.getParameter("IdCompany_FK");
                String avatar=request.getParameter("avatar");
                String password = IdUser_PK +"**";
                
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setUserEmail(UserEmail);
                objUser.setUserName(userName);
                objUser.setUserLastName(userLastName);
                objUser.setIdCompany_FK(idCompany_FK);
                objUser.setAvatar(avatar);
                objUser.setPassword(password );
                
                
                String resultado=  objUser.create();
               
                
                if(resultado.equals("")){
                        
                        String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Usuario Agregado correctamente'); "+
                                 "window.location.href='main.jsp'; "+
                                 "</script></body></html>";
                                 out.println(mensaje);
                }else{resultado.replace("'","");
                     String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert(\"Error  al crear el usuario: ";
                                mensaje= mensaje + resultado; 
                                mensaje= mensaje + "\"); window.location.href='signin.jsp'; "+ "</script></body></html>";
                                System.out.println(mensaje);
                                out.println(mensaje);
                                
                                } 
            
                
            }
            else if(accion.equals("recovery")){
                /*int IdUser_PK = Integer.parseInt(request.getParameter("IdUser_PK"));
                String Password = request.getParameter("Password");
                
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setPassword(Password);
                
                if(objUser.authUser()){
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('usuario o contraseña incorrecto'); "+
                                 "window.location.href='main.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
                else{
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('usuario o contraseña incorrecto'); "+
                                 "window.location.href='signin.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }*/
                
                /*if(accion.equals("signup")){
            
                String UserEmail = request.getParameter("UserEmail");
                String userName= request.getParameter("userName");
                String userLastName= request.getParameter("userLastName");
                int idCompany_FK = Integer.parseInt(request.getParameter("idCompany_FK"));
                String avatar=request.getParameter("avatar");
              
                objUser.setUserEmail(UserEmail);
                objUser.setUserName(userName);
                objUser.setUserLastName(userLastName);
                objUser.setIdCompany_FK(idCompany_FK);
                objUser.setAvatar(avatar);
                
                
                objUser.create();
                
                String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Usuario insertado correctamente'); "+
                                 "window.location.href='index.jsp'; "+
                                 "</script></body></html>";
                        
                        out.println(mensaje); */   

                
            }
        }
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
