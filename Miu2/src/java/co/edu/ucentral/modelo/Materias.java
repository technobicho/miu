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
 * clase que define la persistencia para el objeto materias
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "materias")
@NamedQueries({@NamedQuery(name = "Materias.findAll", query = "SELECT m FROM Materias m"), @NamedQuery(name = "Materias.findByIdMateria", query = "SELECT m FROM Materias m WHERE m.idMateria = :idMateria"), @NamedQuery(name = "Materias.findByNomMateria", query = "SELECT m FROM Materias m WHERE m.nomMateria = :nomMateria")})
public class Materias implements Serializable {
    private static final long serialVersionUID = -1690661497501652904L;
   
    @Id
    @Basic(optional = false)
    @Column(name = "id_materia")
    private Integer idMateria;
    @Basic(optional = false)
    @Column(name = "nom_materia")
    private String nomMateria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "materias")
    private Collection<Horario> horarioCollection;

    public Materias() {
    }

    public Materias(Integer idMateria) {
        this.idMateria = idMateria;
    }

    public Materias(Integer idMateria, String nomMateria) {
        this.idMateria = idMateria;
        this.nomMateria = nomMateria;
    }

    public Integer getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(Integer idMateria) {
        this.idMateria = idMateria;
    }

    public String getNomMateria() {
        return nomMateria;
    }

    public void setNomMateria(String nomMateria) {
        this.nomMateria = nomMateria;
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
        hash += (idMateria != null ? idMateria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materias)) {
            return false;
        }
        Materias other = (Materias) object;
        if ((this.idMateria == null && other.idMateria != null) || (this.idMateria != null && !this.idMateria.equals(other.idMateria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.Materias[idMateria=" + idMateria + "]";
    }

}
