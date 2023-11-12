/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Clase que define la llave primaria para el objeto horario
 * @author David Acosta
 * @version 1.0
 */
@Embeddable
public class HorarioPK implements Serializable {
    private static final long serialVersionUID = -4578552307955657089L;
    @Basic(optional = false)
    @Column(name = "id_docente")
    private int idDocente;
    @Basic(optional = false)
    @Column(name = "id_materia")
    private int idMateria;
    @Basic(optional = false)
    @Column(name = "id_horario")
    private int idHorario;

    public HorarioPK() {
    }

    public HorarioPK(int idDocente, int idMateria, int idHorario) {
        this.idDocente = idDocente;
        this.idMateria = idMateria;
        this.idHorario = idHorario;
    }

    public int getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(int idDocente) {
        this.idDocente = idDocente;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idDocente;
        hash += (int) idMateria;
        hash += (int) idHorario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HorarioPK)) {
            return false;
        }
        HorarioPK other = (HorarioPK) object;
        if (this.idDocente != other.idDocente) {
            return false;
        }
        if (this.idMateria != other.idMateria) {
            return false;
        }
        if (this.idHorario != other.idHorario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.HorarioPK[idDocente=" + idDocente + ", idMateria=" + idMateria + ", idHorario=" + idHorario + "]";
    }

}
