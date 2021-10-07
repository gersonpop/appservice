
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author carolina
 */
public class Company {
    private String idEmpresa_PK;
    public String Razon_Social;
    public String Representante_Legal;
    private String Actividad_Economica;
    private String Persona_Contacto;
    private String Telefono_Contacto;
    private String Status;

    public String getIdEmpresa_PK() {
        return idEmpresa_PK;
    }

    public void setIdEmpresa_PK(String idEmpresa_PK) {
        this.idEmpresa_PK = idEmpresa_PK;
    }

    public String getRazon_Social() {
        return Razon_Social;
    }

    public void setRazon_Social(String Razon_Social) {
        this.Razon_Social = Razon_Social;
    }

    public String getRepresentante_Legal() {
        return Representante_Legal;
    }

    public void setRepresentante_Legal(String Representante_Legal) {
        this.Representante_Legal = Representante_Legal;
    }

    public String getActividad_Economica() {
        return Actividad_Economica;
    }

    public void setActividad_Economica(String Actividad_Economica) {
        this.Actividad_Economica = Actividad_Economica;
    }

    public String getPersona_Contacto() {
        return Persona_Contacto;
    }

    public void setPersona_Contacto(String Persona_Contacto) {
        this.Persona_Contacto = Persona_Contacto;
    }

    public String getTelefono_Contacto() {
        return Telefono_Contacto;
    }

    public void setTelefono_Contacto(String Telefono_Contacto) {
        this.Telefono_Contacto = Telefono_Contacto;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public ResultSet listCompany(){
        Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM company;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            ResultSet resultQuery = stmt.executeQuery();
            objConnex.Disconnect();
             
            return resultQuery;
            
        }catch(SQLException e){
         System.out.println("Error Listar Empresas => " + e);
        }
        return null;
    }
    public void updateCompany(){
    Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="UPDATE Company SET " + 
                    "IdEmpresa_PK =?, " +
                    "Razon_Social =?, " +
                    "Representante_Legal =?, " +
                    "getActividad_Economica =? " +
                    "Persona Contacto =?, " +
                    "Telefono Contacto =?, " +
                    "Status =?, " +
                    "WHERE IdEmpresa_PK  =?;"   ;
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1,this.idEmpresa_PK);
            stmt.setString(2,this.Razon_Social);
            stmt.setString(3,this.Representante_Legal);
            stmt.setString(4,this.Actividad_Economica);
            stmt.setString(5,this.Persona_Contacto);
            stmt.setString(6,this.Telefono_Contacto);
            stmt.setString(7,this.Status);
            objConnex.Disconnect();
            System.out.println("Actualizando datos empresa");
           
            
        }catch(Exception e){
         System.out.println("Error Controlador " + e);
        }
    }
}
