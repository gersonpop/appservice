/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Array;
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
    private String idCompany_FK;
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

    public String getIdCompany_FK() {
        return idCompany_FK;
    }

    public void setIdCompany_FK(String idCompany_FK) {
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
    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    // ---------------Metodos------------------
    
    //--------------Diana------------------------
     public String create(){
     Connex objConnex = new Connex();
     objConnex.Connect();
        
        try{
            System.out.println("voya ingresar un usuairo");
            String sql ="INSERT INTO users(IdUser_PK, UserEmail,UserName,UserLastName,IdCompany_FK,avatar, Password) VALUES (?, ?,?,?,?,?, ?);";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1, this.IdUser_PK);
            stmt.setString(2, this.UserEmail);
            stmt.setString(3,this.userName);
            stmt.setString(4,this.userLastName);
            stmt.setString(5,this.idCompany_FK);
            stmt.setString(6, this.avatar);
            stmt.setString(7, this.Password);
            stmt.execute();
            objConnex.Disconnect();
            return "";
            
        }catch(SQLException e){
         System.out.println("Error al crar al usuario " + e);
         return e.toString();
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
      public User getUserById(){
         Connex objConnex =new Connex();
         objConnex.Connect();
        try{
            String sql ="SELECT * FROM users WHERE IdUser_PK = ?;";
            PreparedStatement stmt;
            stmt = objConnex.conn.prepareStatement(sql);
            stmt.setString(1,this.IdUser_PK);
             ResultSet resultQuery = stmt.executeQuery();
             objConnex.Disconnect();
             User ObjUser = new User();
             while ( resultQuery.next() ) { 
                ObjUser.setIdUser_PK(resultQuery.getString("IdUser_PK"));
                ObjUser.setUserName(resultQuery.getString("userName"));
                ObjUser.setPassword(resultQuery.getString("Password"));
                ObjUser.setUserLastName(resultQuery.getString("userLastName"));
                ObjUser.setIdCompany_FK(resultQuery.getString("idCompany_FK"));
                ObjUser.setUserEmail(resultQuery.getString("UserEmail"));
                ObjUser.setAvatar(resultQuery.getString("avatar"));

             }
             
            return ObjUser;
            
        }catch(SQLException e){
         System.out.println("Error consultar  al usuario => " + e);
        }
        return null;
    }
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


     
     
     
    
}
