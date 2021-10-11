/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;


import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                    
                    User SessionUser= objUser.getUserById();
                    String Nombre = SessionUser.getUserName();
                    System.out.println(SessionUser);
                    
                               /*                     "localStorage.setItem('UserLastName','" + SessionUser.getUserLastName() +"');"+
                                "localStorage.setItem('UserEmail','" + SessionUser.getUserEmail() +"');"+
                                "localStorage.setItem('UserIdCompany_FK()','" + SessionUser.getIdCompany_FK() +"');"+
                                "localStorage.setItem('UserAvatar()','" + SessionUser.getAvatar() +"');"+ */
                    
                    
                    
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                "localStorage.setItem('IdUser_PK','" + SessionUser.getIdUser_PK()+"');"+
                                "localStorage.setItem('UserName','" + SessionUser.getUserName()+"');"+
                                "localStorage.setItem('UserLastName','" + SessionUser.getUserLastName() +"');"+
                                "localStorage.setItem('UserEmail','" + SessionUser.getUserEmail() +"');"+
                                "localStorage.setItem('IdCompany_FK','" + SessionUser.getIdCompany_FK() +"');"+
                                "localStorage.setItem('Avatar','" + SessionUser.getAvatar() +"');"+
                                "window.location.href='main.jsp?Id="+SessionUser.getIdUser_PK()+"'; "+
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
                                 "window.location.href='signup.jsp'; "+
                                 "</script></body></html>";
                                 out.println(mensaje);
                }else{resultado.replace("'","");
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert(\"Error  al crear el usuario: ";
                                mensaje= mensaje + resultado; 
                                mensaje= mensaje + "\"); window.location.href='signup.jsp'; "+ "</script></body></html>";
                                System.out.println(mensaje);
                                out.println(mensaje);
                } 
            }
            else if(accion.equals("recovery")){
                System.out.println("Recuperando contraseña"); 
                    
                String IdUser_PK = request.getParameter("IdUser_PK");
                String UserEmail = request.getParameter("UserEmail");
                
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setUserEmail(UserEmail);
                
                if(objUser.recoveryPSW()){
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('La contraseña ha sido restaurada por defecto'); "+
                                 "window.location.href='signin.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
                else{
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('El usuario o el correo son incorrectos'); "+
                                 "window.location.href='recovery.jsp'; "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
            }else if(accion.equals("changepsw")){
                System.out.println("todo va bien");
                String IdUser_PK = request.getParameter("IdUser_PK");
                String Password = request.getParameter("oldpsw");
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setPassword(Password);
                if(objUser.authUser()){
                    if(request.getParameter("newpsw").equals(request.getParameter("confirmpsw"))){
                        User updateUser= objUser.getUserById();
                        updateUser.setPassword(request.getParameter("newpsw"));
                        updateUser.update();
                        String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('contraseña actualizada correctamente'); "+
                                 "window.location.href='main.jsp'; "+
                                 "</script></body></html>";
                        out.println(mensaje);
                    }else{
                        String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('la nuevas contraseñas no son iguales'); "+
                                 "window.history.back(); "+
                                 "</script></body></html>";
                    out.println(mensaje);
                    }
                }else{
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('contraseña actual incorrecta'); "+
                                 "window.history.back(); "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
                
            }else if(accion.equals("userUpdate")){
                String IdUser_PK = request.getParameter("IdUser_PK");
                String UserEmail = request.getParameter("UserEmail");
                String userName= request.getParameter("UserName");
                String userLastName= request.getParameter("UserLastName");
                String idCompany_FK = request.getParameter("IdCompany_FK");
                String avatar=request.getParameter("avatar");                
                String password=request.getParameter("password");                
                objUser.setIdUser_PK(IdUser_PK);
                objUser.setUserEmail(UserEmail);
                objUser.setUserName(userName);
                objUser.setUserLastName(userLastName);
                objUser.setIdCompany_FK(idCompany_FK);
                objUser.setAvatar(avatar);
                objUser.setPassword(password );
                
                if(objUser.update()){
                    System.out.println("ya guardamos");
                    String mensaje = "<html><body>"+
                                    "<script type='text/javaScript'> "+
                                    "localStorage.setItem('IdUser_PK','" + objUser.getIdUser_PK()+"');"+
                                    "localStorage.setItem('UserName','" + objUser.getUserName()+"');"+
                                    "localStorage.setItem('UserLastName','" + objUser.getUserLastName() +"');"+
                                    "localStorage.setItem('UserEmail','" + objUser.getUserEmail() +"');"+
                                    "localStorage.setItem('IdCompany_FK','" + objUser.getIdCompany_FK() +"');"+
                                    "localStorage.setItem('Avatar','" + objUser.getAvatar() +"');"+
                                
                                    "window.location.href='main.jsp'; "+
                                    "alert('usuario actualizado con éxito'); "+
                                    "</script></body></html>";
                    out.println(mensaje);
                }
                else
                {
                    String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('no se pudo actualizar usuario, inténtelo de nuevo'); "+
                                 "window.history.back(); "+
                                 "</script></body></html>";
                    out.println(mensaje);
                }
            
            
            
            }else if(accion.equals("update")){
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
                objUser.setPassword(password);
                objUser.update();
                
                String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Producto Actualizado correctamente'); "+
                                 "window.location.href='index.jsp'; "+
                                 "</script></body></html>";
                        out.println(mensaje);
            }
            }catch(Exception e){
            System.out.println("Error Controlador user" + e);
            }
        }
   
    public User show(String IdUser_PK){
        try {
            objUser.setIdUser_PK(IdUser_PK);
            ResultSet consulta = objUser.viewProfile(); 
            
            while(consulta.next()){
                objUser = new User(); 
                objUser.setIdUser_PK(consulta.getString(1));
                objUser.setUserEmail(consulta.getString(2));
                objUser.setPassword(consulta.getString(3));
                objUser.setUserName(consulta.getString(4));
                objUser.setUserLastName(consulta.getString(5));
                objUser.setIdCompany_FK(consulta.getString(6));
                objUser.setAvatar(consulta.getString(7));
                return objUser;
                
            } 
            return null;

        } catch (Exception error) {
           System.out.println("Error Controlador de mostrar usuario: " + error);
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
