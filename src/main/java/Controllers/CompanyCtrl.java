/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Company;
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
 * @author carolina
 */
public class CompanyCtrl extends HttpServlet {
Company objCompany = new Company();
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
            
        if(accion.equals("create")){
                String IdEmpresa_PK = request.getParameter(request.getParameter("IdEmpresa_PK"));
                String Razon_Social = request.getParameter("Razon_Social");
                String Representante_Legal = request.getParameter("Representante_Legal");
                String Actividad_Economica = request.getParameter("Actividad_Economica");
                String Persona_Contacto = request.getParameter("Persona_Contacto");
                String Telefono_Contacto = request.getParameter("Telefono_Contacto");
                String Status = request.getParameter("Status");
                
                objCompany.setIdEmpresa_PK(IdEmpresa_PK);
                objCompany.setIdEmpresa_PK(Razon_Social);
                objCompany.setIdEmpresa_PK(Representante_Legal);
                objCompany.setIdEmpresa_PK(Actividad_Economica);
                objCompany.setIdEmpresa_PK(Persona_Contacto);
                objCompany.setIdEmpresa_PK(Telefono_Contacto);
                objCompany.setIdEmpresa_PK(Status);
                
                objCompany.createCompany();
               
                
                String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('Empresa insertada correctamente'); "+
                                 "window.location.href='index.jsp'; "+
                                 "</script></body></html>";
                        
                        out.println(mensaje);
            }else if(accion.equals("update")){
                String IdEmpresa_PK = request.getParameter(request.getParameter("IdEmpresa_PK"));
                String Razon_Social = request.getParameter("Razon_Social");
                String Representante_Legal = request.getParameter("Representante_Legal");
                String Actividad_Economica = request.getParameter("Actividad_Economica");
                String Persona_Contacto = request.getParameter("Persona_Contacto");
                String Telefono_Contacto = request.getParameter("Telefono_Contacto");
                String Status = request.getParameter("Status");
                
                objCompany.setIdEmpresa_PK(IdEmpresa_PK);
                objCompany.setIdEmpresa_PK(Razon_Social);
                objCompany.setIdEmpresa_PK(Representante_Legal);
                objCompany.setIdEmpresa_PK(Actividad_Economica);
                objCompany.setIdEmpresa_PK(Persona_Contacto);
                objCompany.setIdEmpresa_PK(Telefono_Contacto);
                objCompany.setIdEmpresa_PK(Status);
                
                objCompany.update();           
                
                String mensaje = "<html><body>"+
                                 " <script type='text/javaScript'> "+
                                 "alert('empresa Actualizada correctamente'); "+
                                 "window.location.href='index.jsp'; "+
                                 "</script></body></html>";
                        out.println(mensaje);
            }
        }catch(Exception e){
            System.out.println("Error Controlador " + e);
        }
    }
    public ArrayList show(String IdEmpresa_PK ){
        try {
            objCompany.setIdEmpresa_PK(IdEmpresa_PK);
            ResultSet consulta = objCompany.show(); 
            ArrayList<Company> listCompany = new ArrayList<>(); 
            
            while(consulta.next()){
                objCompany = new Company(); 
                objCompany.setIdEmpresa_PK(consulta.getString(1));
                objCompany.setRazon_Social(consulta.getString(2));
                objCompany.setRepresentante_Legal(consulta.getString(3));
                objCompany.setActividad_Economica(consulta.getString(4));
                objCompany.setPersona_Contacto(consulta.getString(5));
                objCompany.setTelefono_Contacto(consulta.getString(6));
                objCompany.setStatus(consulta.getString(7));
                listCompany.add(objCompany); 
                
            }
            
            return listCompany; 
            
        } catch (Exception error) {
            System.out.println("Error Controlador: " + error);
        }
 
        return null;
    }
             
    public ArrayList list(){
        try {
            ResultSet consulta = objCompany.listCompany(); 
            ArrayList<Company> listCompany = new ArrayList<>(); 
            
            while(consulta.next()){
                objCompany = new Company(); 
                objCompany.setIdEmpresa_PK(consulta.getString(1));
                objCompany.setRazon_Social(consulta.getString(2));
                objCompany.setRepresentante_Legal(consulta.getString(3));
                objCompany.setActividad_Economica(consulta.getString(4));
                objCompany.setPersona_Contacto(consulta.getString(5));
                objCompany.setTelefono_Contacto(consulta.getString(6));
                objCompany.setStatus(consulta.getString(7));
                listCompany.add(objCompany); 
                
            }
            
            return listCompany; 
            
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
