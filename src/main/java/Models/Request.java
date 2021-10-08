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
 * @author Gerson Porras
 */
public class Request {
    private int IdRequerimiento_PK;
    private String Fecha_Solicitud;
    private String fecha_inicio_req;
    private String fecha_fin_req;
    private int IdCotizacion;
    private String Fecha_Cotizacion;
    private String Fecha_Aprov_Cot;
    private int IdOrdenServicio;
    private String Fecha_Ejec_Ord_Serv;
    private int IdInforme;
    private String Fecha_Informe;
    private int IdEncuestasSatisf;
    private String Fecha_Encuesta;
    private String Estado;
    private String IdUser_FK;
    private String IdCompany_FK;
    private String RQDescripcion;

    public Request() {
    }

    public int getIdRequerimiento_PK() {
        return IdRequerimiento_PK;
    }

    public void setIdRequerimiento_PK(int IdRequerimiento_PK) {
        this.IdRequerimiento_PK = IdRequerimiento_PK;
    }

    public String getFecha_Solicitud() {
        return Fecha_Solicitud;
    }

    public void setFecha_Solicitud(String Fecha_Solicitud) {
        this.Fecha_Solicitud = Fecha_Solicitud;
    }

    public String getFecha_inicio_req() {
        return fecha_inicio_req;
    }

    public void setFecha_inicio_req(String fecha_inicio_req) {
        this.fecha_inicio_req = fecha_inicio_req;
    }

    public String getFecha_fin_req() {
        return fecha_fin_req;
    }

    public void setFecha_fin_req(String fecha_fin_req) {
        this.fecha_fin_req = fecha_fin_req;
    }

    public int getIdCotizacion() {
        return IdCotizacion;
    }

    public void setIdCotizacion(int IdCotizacion) {
        this.IdCotizacion = IdCotizacion;
    }

    public String getFecha_Cotizacion() {
        return Fecha_Cotizacion;
    }

    public void setFecha_Cotizacion(String Fecha_Cotizacion) {
        this.Fecha_Cotizacion = Fecha_Cotizacion;
    }

    public String getFecha_Aprov_Cot() {
        return Fecha_Aprov_Cot;
    }

    public void setFecha_Aprov_Cot(String Fecha_Aprov_Cot) {
        this.Fecha_Aprov_Cot = Fecha_Aprov_Cot;
    }

    public int getIdOrdenServicio() {
        return IdOrdenServicio;
    }

    public void setIdOrdenServicio(int IdOrdenServicio) {
        this.IdOrdenServicio = IdOrdenServicio;
    }

    public String getFecha_Ejec_Ord_Serv() {
        return Fecha_Ejec_Ord_Serv;
    }

    public void setFecha_Ejec_Ord_Serv(String Fecha_Ejec_Ord_Serv) {
        this.Fecha_Ejec_Ord_Serv = Fecha_Ejec_Ord_Serv;
    }

    public int getIdInforme() {
        return IdInforme;
    }

    public void setIdInforme(int IdInforme) {
        this.IdInforme = IdInforme;
    }

    public String getFecha_Informe() {
        return Fecha_Informe;
    }

    public void setFecha_Informe(String Fecha_Informe) {
        this.Fecha_Informe = Fecha_Informe;
    }

    public int getIdEncuestasSatisf() {
        return IdEncuestasSatisf;
    }

    public void setIdEncuestasSatisf(int IdEncuestasSatisf) {
        this.IdEncuestasSatisf = IdEncuestasSatisf;
    }

    public String getFecha_Encuesta() {
        return Fecha_Encuesta;
    }

    public void setFecha_Encuesta(String Fecha_Encuesta) {
        this.Fecha_Encuesta = Fecha_Encuesta;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getIdUser_FK() {
        return IdUser_FK;
    }

    public void setIdUser_FK(String IdUser_FK) {
        this.IdUser_FK = IdUser_FK;
    }

    public String getIdCompany_FK() {
        return IdCompany_FK;
    }

    public void setIdCompany_FK(String IdCompany_FK) {
        this.IdCompany_FK = IdCompany_FK;
    }

    public String getRQDescripcion() {
        return RQDescripcion;
    }

    public void setRQDescripcion(String RQDescripcion) {
        this.RQDescripcion = RQDescripcion;
    }
    
    public Boolean Create(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{

         
            
            String sql ="INSERT INTO requerimiento( IdUser_FK, IdCompany_FK) VALUES (?, ?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.IdUser_FK);
            stmt.setString(2, this.IdCompany_FK);
         
            stmt.execute();
             objConnex.Disconnect(); 
            return true;
            
             
        }catch(SQLException e){
         System.out.println("Error al crear la RQ inicial " + e);
         return false;
        } 
        
    }
    /*
    UPDATE requerimiento 
    SET Fecha_Solicitud=?,fecha_inicio_req=?,fecha_fin_req=?,IdCotizacion=?,
    Fecha_Cotizacion=?,Fecha_Aprov_Cot=?,IdOrdenServicio=?,Fecha_Ejec_Ord_Serv=?,IdInforme=?,Fecha_Informe=?,
    IdEncuestasSatisf=?,Fecha_Encuesta=?,Estado=?,IdUser_FK=?,IdCompany_FK=?,RQDescripcion=? WHERE IdRequerimiento_PK=?;
    
    
    */
    public Boolean DeleteTemp(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        try{
            String sql ="DELETE FROM requerimiento WHERE IdUser_FK=? AND IdCompany_FK=? AND  Estado='temp' ";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.IdUser_FK);
            stmt.setString(2, this.IdCompany_FK);
         
            stmt.execute();
            objConnex.Disconnect(); 
            System.out.println("Estamos borrando las RQ temporales");
            
             return true;
            
             
        }catch(SQLException e){
         System.out.println("Error al borrar rq la RQ inicial " + e);
         return false;
        } 
        
    }
    
    public Boolean UpdateCliente(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="UPDATE requerimiento " +
                    "    SET fecha_inicio_req=?,fecha_fin_req=? , " +
                    "    Estado=?, RQDescripcion=? WHERE IdRequerimiento_PK=?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.fecha_inicio_req);
            stmt.setString(2, this.fecha_fin_req);
            stmt.setString(3, this.Estado);
            System.out.println("Estamos actualizando RQ Cliente =>" + this.RQDescripcion);
            
            stmt.setString(4, this.RQDescripcion);
            stmt.setInt(5, this.IdRequerimiento_PK);
            stmt.execute();
            objConnex.Disconnect(); 
            return true;
            
             
        }catch(SQLException e){
         System.out.println("Error al actualizar la RQ Cliente" + e);
         return false;
        } 
        
    }
    public String lastRqCreated(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="SELECT IdRequerimiento_PK FROM requerimiento WHERE IdUser_FK=? AND IdCompany_FK=? AND  Estado='temp' order by IdRequerimiento_PK desc limit 1;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.IdUser_FK);
            stmt.setString(2, this.IdCompany_FK);
            ResultSet resultQuery = stmt.executeQuery();
            objConnex.Disconnect();  
            System.out.println("Estamos obteniendo ela ultima rq creada");
             while ( resultQuery.next() ){
            String idRQ = resultQuery.getString(1); 
            return idRQ;
             }
             
        }catch(SQLException e){
         System.out.println("Error al consultar la ultima RQ " + e);
         
        } 
       return "err"; 
    }
    
    
    public String GetRqByID(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="SELECT IdRequerimiento_PK FROM requerimiento WHERE IdRequerimiento_PK=? ;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1, this.IdRequerimiento_PK);
            ResultSet resultQuery = stmt.executeQuery();
            objConnex.Disconnect();  
            System.out.println("Estamos obteniendo una RQ especifica");
            while ( resultQuery.next() ){
                String idRQ = resultQuery.getString(1); 
            return idRQ;
            }
             
        }catch(SQLException e){
         System.out.println("Error al consultar la ultima RQ " + e);
         
        } 
       return "err"; 
    }
        
  
}
