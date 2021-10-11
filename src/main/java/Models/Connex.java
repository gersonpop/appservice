/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Gerson Porras
 */
public class Connex {
    public Connection conn;
    /*conexion para pruebas en servidor local // */ 
    
    private String host="Localhost:3306";
    private String database="appServices";
    private String user="root";
    private String password="";//*/
    
    /*conexion para despliegue en en servidor remoto // */ 
    /*
    private String host="Localhost:3306";
    private String database="c3s46grupo8";
    private String user="c3s46grupo8";
    private String password="ZXTL8ing";//*/
    
    //metodos
    public void Connect (){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://" + this.host + "/"+ this.database +"?zeroDateTimeBehavior=CONVERT_TO_NULL", this.user, this.password);
            System.out.println("Conexion Exitosa");
        }
        catch(Exception e){
            System.out.println("error en la conexion "+ e);
        }
    }
    
    public void Disconnect(){
        conn= null;
    }
}
