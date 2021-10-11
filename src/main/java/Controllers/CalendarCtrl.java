/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Calendar;
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
@WebServlet(name = "CalendarCtrl", urlPatterns = {"/CalendarCtrl"})
public class CalendarCtrl extends HttpServlet {
Calendar objCalendar = new Calendar();
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CalendarCtrl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CalendarCtrl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public ArrayList getAll(){
        try {
            ResultSet consulta = objCalendar.getAll(); 
            ArrayList<Calendar> listCalendar = new ArrayList<>(); 
            
            while(consulta.next()){
                objCalendar = new Calendar(); 
                objCalendar.setIdCalendar(consulta.getInt(1));
                objCalendar.setTitle(consulta.getString(2));
                objCalendar.setStart(consulta.getString(3));
                objCalendar.setEnd(consulta.getString(4));
                objCalendar.setClassName(consulta.getString(9));
                objCalendar.setUrl(consulta.getString(10));
               
               
                listCalendar.add(objCalendar); 
                
            }
            
            return listCalendar; 
            
        } catch (Exception error) {
            System.out.println("Error controlador al obtener todo el calendario: " + error);
        }
 
        return null;
    }
    
    public ArrayList getById(String Id){
        try {
            objCalendar.setIdUser_FK(Id);
            ResultSet consulta = objCalendar.getById(); 
            ArrayList<Calendar> listCalendar = new ArrayList<>(); 
            
            while(consulta.next()){
                objCalendar = new Calendar(); 
                objCalendar.setIdCalendar(consulta.getInt(1));
                objCalendar.setTitle(consulta.getString(2));
                objCalendar.setStart(consulta.getString(3));
                objCalendar.setEnd(consulta.getString(4));
                objCalendar.setClassName(consulta.getString(9));
                objCalendar.setUrl(consulta.getString(10));
               
               
                listCalendar.add(objCalendar); 
                
            }
            
            return listCalendar; 
            
        } catch (Exception error) {
            System.out.println("Error controlador al obetner calendario por usuario: " + error);
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
