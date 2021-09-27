/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Gerson Porras
 */
public class User {
    private int idUser_PK;
    private String userName;
    private String userLastName;
    private int idCompany_FK;
    private String avatar;
    private String UserEmail;

    public User() {
    }

    public int getIdUser_PK() {
        return idUser_PK;
    }

    public void setIdUser_PK(int idUser_PK) {
        this.idUser_PK = idUser_PK;
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
    
    
     public void create(){}
     public void list(){}
     public void delete(){}
     public void show(){}
     public void update(){}
     
     
     
    
}
