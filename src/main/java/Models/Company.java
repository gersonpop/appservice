/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

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

    public Company() {
        
    }
      
}
