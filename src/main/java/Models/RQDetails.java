/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static javax.ws.rs.client.Entity.json;

/**IdDeralleRQ_PK 
 *
 * @author Gerson Porras
 */
public class RQDetails {
    private int IdDeralleRQ_PK;
    private int IdRequerimiento_FK; 
    private int IdSucursal_FK;
    private int IdEquipo_FK;
    private String Descripcion_RQ;
    private String Estado;

    public int getIdSucursal_FK() {
        return IdSucursal_FK;
    }

    public void setIdSucursal_FK(int IdSucursal_FK) {
        this.IdSucursal_FK = IdSucursal_FK;
    }

    public RQDetails() {
    }

    public int getIdDeralleRQ_PK() {
        return IdDeralleRQ_PK;
    }

    public void setIdDeralleRQ_PK(int IdDeralleRQ_PK) {
        this.IdDeralleRQ_PK = IdDeralleRQ_PK;
    }

    public int getIdRequerimiento_FK() {
        return IdRequerimiento_FK;
    }

    public void setIdRequerimiento_FK(int IdRequerimiento_FK) {
        this.IdRequerimiento_FK = IdRequerimiento_FK;
    }

    public int getIdEquipo_FK() {
        return IdEquipo_FK;
    }

    public void setIdEquipo_FK(int IdEquipo_FK) {
        this.IdEquipo_FK = IdEquipo_FK;
    }

    public String getDescripcion_RQ() {
        return Descripcion_RQ;
    }

    public void setDescripcion_RQ(String Descripcion_RQ) {
        this.Descripcion_RQ = Descripcion_RQ;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    public boolean InsertItem(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            
                        
            String sql ="INSERT INTO detalle_rq VALUES (null,?,?,?,?,?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1,this.IdRequerimiento_FK);
            stmt.setInt(2,this.IdSucursal_FK);
            stmt.setInt(3,this.IdEquipo_FK);
            stmt.setString(4,this.Descripcion_RQ);
            stmt.setString(5, this.Estado);
            stmt.execute();
            objConnex.Disconnect();
            System.out.println("estoy insertando varios datos en rq details");
            return true;
        }catch(Exception e){
         System.out.println("Error inserta detalles de rq  " + e);
         return false;
        }
    }
    
    public ResultSet getByIdRQ(){
        Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM detalle_rq WHERE IdRequerimiento_FK=? ;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1,this.IdRequerimiento_FK);
            ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
             
            return resultQuery;
            
        }catch(SQLException e){
         System.out.println("Error Listar DEtaller RQ => " + e);
        }
        return null;
    }
            
            
            
}
