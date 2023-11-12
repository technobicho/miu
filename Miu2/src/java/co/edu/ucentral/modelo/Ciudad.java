/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Clase que define la persistencia del objeto Ciudad
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "ciudad")
@NamedQueries({@NamedQuery(name = "Ciudad.findAll", query = "SELECT c FROM Ciudad c"), @NamedQuery(name = "Ciudad.findByIdCiudad", query = "SELECT c FROM Ciudad c WHERE c.idCiudad = :idCiudad"), @NamedQuery(name = "Ciudad.findByNomCiudad", query = "SELECT c FROM Ciudad c WHERE c.nomCiudad = :nomCiudad")})
public class Ciudad implements Serializable {
    private static final long serialVersionUID = 8353512191893836935L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @Id
    @Basic(optional = false)
    @Column(name = "id_ciudad")
    private Integer idCiudad;
    @Basic(optional = false)
    @Column(name = "nom_ciudad")
    private String nomCiudad;    
    @JoinColumn(name = "id_dept", referencedColumnName = "id_dept")
    @ManyToOne(optional = false)
    private Departamento idDept;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ciudad")
    private Collection<EdificioInfo> EdificioInfoCollection;

    public Ciudad() {
    }

    public Ciudad(Integer idCiudad) {
        this.idCiudad = idCiudad;
    }

    public Ciudad(Integer idCiudad, String nomCiudad) {
        this.idCiudad = idCiudad;
        this.nomCiudad = nomCiudad;
    }

    public Integer getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(Integer idCiudad) {
        Integer oldIdCiudad = this.idCiudad;
        this.idCiudad = idCiudad;
        changeSupport.firePropertyChange("idCiudad", oldIdCiudad, idCiudad);
    }

    public String getNomCiudad() {
        return nomCiudad;
    }

    public void setNomCiudad(String nomCiudad) {
        String oldNomCiudad = this.nomCiudad;
        this.nomCiudad = nomCiudad;
        changeSupport.firePropertyChange("nomCiudad", oldNomCiudad, nomCiudad);
    }

    

    public Departamento getIdDept() {
        return idDept;
    }

    public void setIdDept(Departamento idDept) {
        Departamento oldIdDept = this.idDept;
        this.idDept = idDept;
        changeSupport.firePropertyChange("idDept", oldIdDept, idDept);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCiudad != null ? idCiudad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ciudad)) {
            return false;
        }
        Ciudad other = (Ciudad) object;
        if ((this.idCiudad == null && other.idCiudad != null) || (this.idCiudad != null && !this.idCiudad.equals(other.idCiudad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.Ciudad[idCiudad=" + idCiudad + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the EdificioInfoCollection
     */
    public Collection<EdificioInfo> getEdificioInfoCollection() {
        return EdificioInfoCollection;
    }

    /**
     * @param EdificioInfoCollection the EdificioInfoCollection to set
     */
    public void setEdificioInfoCollection(Collection<EdificioInfo> EdificioInfoCollection) {
        this.EdificioInfoCollection = EdificioInfoCollection;
    }

}
