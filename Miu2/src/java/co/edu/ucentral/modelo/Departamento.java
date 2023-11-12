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
 * Clase que define la persistencia para el objeto Departamento
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "departamento")
@NamedQueries({@NamedQuery(name = "Departamento.findAll", query = "SELECT d FROM Departamento d"), @NamedQuery(name = "Departamento.findByIdDept", query = "SELECT d FROM Departamento d WHERE d.idDept = :idDept"), @NamedQuery(name = "Departamento.findByNomDept", query = "SELECT d FROM Departamento d WHERE d.nomDept = :nomDept")})
public class Departamento implements Serializable {
    private static final long serialVersionUID = -8825143476046073372L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_dept")
    private Integer idDept;
    @Column(name = "nom_dept")
    private String nomDept;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDept")
    private Collection<Ciudad> ciudadCollection;

    public Departamento() {
    }

    public Departamento(Integer idDept) {
        this.idDept = idDept;
    }

    public Integer getIdDept() {
        return idDept;
    }

    public void setIdDept(Integer idDept) {
        this.idDept = idDept;
    }

    public String getNomDept() {
        return nomDept;
    }

    public void setNomDept(String nomDept) {
        this.nomDept = nomDept;
    }

    public Collection<Ciudad> getCiudadCollection() {
        return ciudadCollection;
    }

    public void setCiudadCollection(Collection<Ciudad> ciudadCollection) {
        this.ciudadCollection = ciudadCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDept != null ? idDept.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Departamento)) {
            return false;
        }
        Departamento other = (Departamento) object;
        if ((this.idDept == null && other.idDept != null) || (this.idDept != null && !this.idDept.equals(other.idDept))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.Departamento[idDept=" + idDept + "]";
    }

}
