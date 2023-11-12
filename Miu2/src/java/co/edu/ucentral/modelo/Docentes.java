/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Clase que define la persistencia para el objeto Docentes
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "docentes")
@NamedQueries({@NamedQuery(name = "Docentes.findAll", query = "SELECT d FROM Docentes d"), @NamedQuery(name = "Docentes.findByIdDocente", query = "SELECT d FROM Docentes d WHERE d.idDocente = :idDocente"), @NamedQuery(name = "Docentes.findByNombre1", query = "SELECT d FROM Docentes d WHERE d.nombre1 = :nombre1"), @NamedQuery(name = "Docentes.findByNombre2", query = "SELECT d FROM Docentes d WHERE d.nombre2 = :nombre2"), @NamedQuery(name = "Docentes.findByApellido1", query = "SELECT d FROM Docentes d WHERE d.apellido1 = :apellido1"), @NamedQuery(name = "Docentes.findByApellido2", query = "SELECT d FROM Docentes d WHERE d.apellido2 = :apellido2")})
public class Docentes implements Serializable {
    private static final long serialVersionUID = -3885960294997306674L;
   
    @Id
    @Basic(optional = false)
    @Column(name = "id_docente")
    private Integer idDocente;
    @Basic(optional = false)
    @Column(name = "nombre1")
    private String nombre1;
    @Column(name = "nombre2")
    private String nombre2;
    @Basic(optional = false)
    @Column(name = "apellido1")
    private String apellido1;
    @Column(name = "apellido2")
    private String apellido2;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "docentes")
    private Collection<Horario> horarioCollection;

    public Docentes() {
    }

    public Docentes(Integer idDocente) {
        this.idDocente = idDocente;
    }

    public Docentes(Integer idDocente, String nombre1, String apellido1) {
        this.idDocente = idDocente;
        this.nombre1 = nombre1;
        this.apellido1 = apellido1;
    }

    public Integer getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(Integer idDocente) {
        this.idDocente = idDocente;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public Collection<Horario> getHorarioCollection() {
        return horarioCollection;
    }

    public void setHorarioCollection(Collection<Horario> horarioCollection) {
        this.horarioCollection = horarioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDocente != null ? idDocente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Docentes)) {
            return false;
        }
        Docentes other = (Docentes) object;
        if ((this.idDocente == null && other.idDocente != null) || (this.idDocente != null && !this.idDocente.equals(other.idDocente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.Docentes[idDocente=" + idDocente + "]";
    }

}
