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
public class User {
    private String IdUser_PK;
    private String userName;
    private String Password;
    private String userLastName;
    private int idCompany_FK;
    private String avatar;
    private String UserEmail;

    public User() {
    }

    public String getIdUser_PK() {
        return IdUser_PK;
    }

    public void setIdUser_PK(String idUser_PK) {
        this.IdUser_PK = idUser_PK;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public int getIdCompany_FK() {
        return idCompany_FK;
    }

    public void setIdCompany_FK(int idCompany_FK) {
        this.idCompany_FK = idCompany_FK;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }
    
    // ---------------Metodos------------------
    
    //--------------Diana------------------------
     public void create(){
     Connex objConnex = new Connex();
     objConnex.Connect();
        
        try{
            String sql ="INSERT INTO users(UserEmail,UserName,UserLastName,IdCompany_FK,avatar) VALUES (?,?,?,?,?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.UserEmail);
            stmt.setString(2,this.userName);
            stmt.setString(3,this.userLastName);
            stmt.setInt(4,this.idCompany_FK);
            stmt.setString(5, this.avatar);
            stmt.execute();
            objConnex.Disconnect();
            System.out.println("estoy ingresando un usuario");
            
        }catch(Exception e){
         System.out.println("Error Controlador " + e);
        }
    
     
     }
     public void list(){}
     public void delete(){}
     public void show(){}
     public void update(){}
     
     
     //--------------Liliana------------------------
     public boolean recoveryPSW(){
                 // consultas en BD que el IdUser_PK y email existan SELECT * FROM users WHERE IdUser_PK = ? AND UserEmail = ?;"
                 
                 //si existe se debe actualiza el password con el idUser con IdUser**  ="UPDATE producto SET Password =?(IdUser**),WHERE IdUser_PK =?;"   ;
                 
                 
        return false;
     
         
     
     }
     
     
     //--------------Gerson------------------------
     public boolean authUser(){
        Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM users WHERE IdUser_PK = ? AND Password = ?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1,this.IdUser_PK);
            stmt.setString(2,this.Password);
             ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
             while ( resultQuery.next() ) { 
                // Read the next item
                
                if(resultQuery.getString("IdUser_PK").equals(this.IdUser_PK)){
                 System.out.println("listo "+ resultQuery.getString("IdUser_PK"));
                System.out.println(this.IdUser_PK);
                return true;
             }
            }
             
            /*if(resultQuery.wasNull()){
                 return true;
             }*/
             return false;
            
        }catch(SQLException e){
         System.out.println("Error consultar  usuario => " + e);
        }
       return false;
     }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
     
     
     
    
}
