/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;


/**
 *
 * @author Gerson Porras
 */
public class Calendar {
private int IdCalendar;
private String title;
private String start ;
private String end;
private String IdUser_FK;
private String Tipo_Documento;
private int id_documento;
private String estado;
private String className;
private String url;

//_______constructor
     public Calendar() {
    }
     
//  ----------metodos getter and setter

    public int getIdCalendar() {
        return IdCalendar;
    }

    public void setIdCalendar(int IdCalendar) {
        this.IdCalendar = IdCalendar;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getIdUser_FK() {
        return IdUser_FK;
    }

    public void setIdUser_FK(String IdUser_FK) {
        this.IdUser_FK = IdUser_FK;
    }

    public String getTipo_Documento() {
        return Tipo_Documento;
    }

    public void setTipo_Documento(String Tipo_Documento) {
        this.Tipo_Documento = Tipo_Documento;
    }

    public int getId_documento() {
        return id_documento;
    }

    public void setId_documento(int id_documento) {
        this.id_documento = id_documento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    // ----------------metodos
           
    public ResultSet getAll(){
        Connex objConnex =new Connex();
        objConnex.Connect();
        try{
            String sql ="SELECT * FROM Calendar;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();

            return resultQuery;

        }catch(SQLException e){
         System.out.println("Error Listar Productos => " + e);
        }
        return null;
      
           
    }
     public ResultSet getById(){
        Connex objConnex =new Connex();
        objConnex.Connect();
        try{
             String sql ="SELECT * FROM calendar WHERE IDUser_FK = ?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1,this.IdUser_FK);
             ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
             System.out.println("estoy consultando calendario sql");
             
            return resultQuery;

        }catch(SQLException e){
         System.out.println("Error consultar calenario por ID => " + e);
        }
        return null;
      
           
    }
     
      public boolean InsertDate(){
        Connex objConnex =new Connex();
        objConnex.Connect();
        try{
             String sql ="INSERT INTO `calendar`"
                     + "( `title`, `start`, `end`, `IdUser_FK`, `Tipo_Documento`, `id_documento`, `estado`, `className`, `url`)"
                     + " VALUES "
                     + "(?,?,?,?,?,?,?,?,?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1,this.title);
            stmt.setString(2,this.start);
            stmt.setString(3,this.end);
            stmt.setString(4,this.IdUser_FK);
            stmt.setString(5,this.Tipo_Documento);
            stmt.setInt(6,this.id_documento);
            stmt.setString(7,this.estado);
            stmt.setString(8,this.className);
            stmt.setString(9,this.url);
             stmt.execute();
             objConnex.Disconnect();
             System.out.println("estoy agregando cita a calendario sql");
             
            return true;

        }catch(SQLException e){
         System.out.println("Error agregar cita a calenario  " + e);
        }
        //return false;
      
           
    }
}
