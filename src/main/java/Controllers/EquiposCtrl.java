/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;


import Models.Equipo;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "EquiposCtrl", urlPatterns = {"/EquiposCtrl"})
public class EquiposCtrl extends HttpServlet {
Equipo objEquipo = new Equipo();
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
        try{
          
        }
        catch(Exception ex)
        {   
            System.out.println("Error en poblar selec con equipo  :"+ex);
            ex.printStackTrace();
        }
        
        
    }

    public ArrayList obtenerEQporSucursal(int IdSucursal){
        try {
            objEquipo.setIdSucursal_FK(IdSucursal);
            ResultSet consulta = objEquipo.getEQbySucursal(); 
            ArrayList<Equipo> listaEquipo = new ArrayList<>(); 
            
            while(consulta.next()){
                objEquipo = new Equipo(); 
                objEquipo.setIdEquipo_PK(consulta.getInt(1));
                objEquipo.setTAG(consulta.getString(2));
                
                listaEquipo.add(objEquipo); 
                
            }
            
            return listaEquipo; 
            
        } catch (Exception error) {
            System.out.println("Error Controlador: " + error);
       
 
        return null; }
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
        
         try{
            objEquipo.setIdSucursal_FK(Integer.parseInt(request.getParameter("IdSucursal_FK")));
            JsonArray data_json=new JsonArray();
            JsonObject json_response=new JsonObject();
            ResultSet res = objEquipo.getEQbySucursal();
            while(res.next()){         
                JsonObject json=new JsonObject();
                json.addProperty("IdEquipo_PK", res.getString(1));
                json.addProperty("TAG", res.getString(2));
                data_json.add(json);
            }
            System.out.println(data_json);
            json_response.add("DataEQ", data_json);
            response.setContentType("application/Json");
            response.getWriter().write(json_response.toString());
            System.out.println(json_response);
        }
        catch(IOException | NumberFormatException | SQLException ex)
        {   
            System.out.println("Error en poblar selec con equipo  :"+ex);
        }
        
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
