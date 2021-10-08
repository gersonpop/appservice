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
public class Equipo {
    private int	IdEquipo_PK;
    private String CodigoEquipo;
    private String TAG;
    private String Marca;
    private String Modelo;
    private String Tipo;
    private String Potencia;
    private String Puesta_enservicio;
    private String Serial;
    private int	IdSucursal_FK;

    public Equipo() {
    }

    public int getIdEquipo_PK() {
        return IdEquipo_PK;
    }

    public void setIdEquipo_PK(int IdEquipo_PK) {
        this.IdEquipo_PK = IdEquipo_PK;
    }

    public String getCodigoEquipo() {
        return CodigoEquipo;
    }

    public void setCodigoEquipo(String CodigoEquipo) {
        this.CodigoEquipo = CodigoEquipo;
    }

    public String getTAG() {
        return TAG;
    }

    public void setTAG(String TAG) {
        this.TAG = TAG;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getPotencia() {
        return Potencia;
    }

    public void setPotencia(String Potencia) {
        this.Potencia = Potencia;
    }

    public String getPuesta_enservicio() {
        return Puesta_enservicio;
    }

    public void setPuesta_enservicio(String Puesta_enservicio) {
        this.Puesta_enservicio = Puesta_enservicio;
    }

    public String getSerial() {
        return Serial;
    }

    public void setSerial(String Serial) {
        this.Serial = Serial;
    }

    public int getIdSucursal_FK() {
        return IdSucursal_FK;
    }

    public void setIdSucursal_FK(int IdSucursal_FK) {
        this.IdSucursal_FK = IdSucursal_FK;
    }
    
    
    public ResultSet getEQbySucursal(){
         Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            System.out.println("la sucursal es " + this.IdSucursal_FK);
            String sql ="SELECT IdEquipo_PK, TAG FROM equipo WHERE IdSucursal_FK = ?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1,this.IdSucursal_FK);
             ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
            
            return resultQuery;
            
        }catch(SQLException e){
         System.out.println("Error consultar equipo => " + e);
        }
        return null;
    }

    
    
}
