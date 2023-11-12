/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Clase que define la llave unica para la vista proporcionada por universitas
 * para la informacion de docentes y horarios
 * @author David Acosta
 * @version 1.0
 */
@Embeddable
public class UccVwmapaPK implements Serializable {

    private static final long serialVersionUID = -7344171675865503372L;
    @Column(name = "idprofesor")
    private int idprofesor;
    @Column(name = "diasemana")
    private String diasemana;
    @Column(name = "hora")
    private String hora;
    @Column(name = "codigoasignatura")
    private String codigoasignatura;

    public UccVwmapaPK() {
    }

    public UccVwmapaPK(int idprofesor, String diasemana, String hora, String codigoasignatura) {
        this.idprofesor = idprofesor;
        this.diasemana = diasemana;
        this.hora = hora;
        this.codigoasignatura = codigoasignatura;
    }

    /**
     * @return the idprofesor
     */
    public int getIdProfesor() {
        return idprofesor;
    }

    /**
     * @param idprofesor the idprofesor to set
     */
    public void setIdProfesor(int idProfesor) {
        this.idprofesor = idProfesor;
    }

    /**
     * @return the diasemana
     */
    public String getDiaSemana() {
        return diasemana;
    }

    /**
     * @param diasemana the diasemana to set
     */
    public void setDiaSemana(String diaSemana) {
        this.diasemana = diaSemana;
    }

    /**
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(String hora) {
        this.hora = hora;
    }

    /**
     * @return the codigoasignatura
     */
    public String getCodigoAsignatura() {
        return codigoasignatura;
    }

    /**
     * @param codigoasignatura the codigoasignatura to set
     */
    public void setCodigoAsignatura(String codigoAsignatura) {
        this.codigoasignatura = codigoAsignatura;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idprofesor;
        hash += (int) diasemana.hashCode();
        hash += (int) hora.hashCode();
        hash += (int) codigoasignatura.hashCode();
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof UccVwmapaPK)) {
            return false;
        }
        UccVwmapaPK pk = (UccVwmapaPK) obj;
        return pk.idprofesor == idprofesor && pk.diasemana.equals(diasemana) && pk.hora.equals(hora) && pk.codigoasignatura.equals(codigoasignatura);
    }

    
}
