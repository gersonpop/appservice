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
 * @author PC_Daniel
 */
public class Producto {
    //ATRIBUTOS 
    private int codigoProducto; 
    private String nombreProducto; 
    private int cantidadProducto; 
    private int precioProducto; 
    private String categoriaProducto; 
    
    //CONSTRUCTOR
    public Producto() {
    }

    //ENCAPSULAR 
    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public int getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(int precioProducto) {
        this.precioProducto = precioProducto;
    }

    public String getCategoriaProducto() {
        return categoriaProducto;
    }

    public void setCategoriaProducto(String categoriaProducto) {
        this.categoriaProducto = categoriaProducto;
    }
    
    
    //METODOS 
    public void crearProducto(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="INSERT INTO producto VALUES (?,?,?,?,?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1,this.codigoProducto);
            stmt.setString(2,this.nombreProducto);
            stmt.setInt(3,this.cantidadProducto);
            stmt.setInt(4, this.precioProducto);
            stmt.setString(5, this.categoriaProducto);
            stmt.execute();
            objConnex.Disconnect();
            System.out.println("estoy consultando datos en la lista");
            
        }catch(Exception e){
         System.out.println("Error Controlador " + e);
        }
    }
    
    public ResultSet consultarProducto(){
         Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM producto WHERE codigoProducto = ?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(1,this.codigoProducto);
             ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
             System.out.println("estoy consultando producto sql");
             
            return resultQuery;
            
        }catch(SQLException e){
         System.out.println("Error consultar  Producto => " + e);
        }
        return null;
    }
    
    public ResultSet listarProducto(){
        Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM producto;";
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
    
    public void actualizarProducto(){
        Connex objConnex = new Connex();
        objConnex.Connect();
        
        try{
            String sql ="UPDATE producto SET " + 
                    "nombreProducto =?, " +
                    "cantidadProducto =?, " +
                    "precioProducto =?, " +
                    "categoria =? " +
                    "WHERE codigoProducto =?;"   ;
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setInt(5,this.codigoProducto);
            stmt.setString(1,this.nombreProducto);
            stmt.setInt(2,this.cantidadProducto);
            stmt.setInt(3, this.precioProducto);
            stmt.setString(4, this.categoriaProducto);
            stmt.execute();
            objConnex.Disconnect();
            System.out.println("estoy consultando datos en la lista");
            
        }catch(Exception e){
         System.out.println("Error Controlador " + e);
        }
    }
    
    public void eliminarProducto(){
        
    }
}