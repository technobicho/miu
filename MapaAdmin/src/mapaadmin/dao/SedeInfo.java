/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin.dao;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
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
import javax.persistence.Transient;

/**
 *
 * @author David Acosta
 */
@Entity
@Table(name = "sede_info")
@NamedQueries({@NamedQuery(name = "SedeInfo.findAll", query = "SELECT s FROM SedeInfo s"), @NamedQuery(name = "SedeInfo.findByIdSede", query = "SELECT s FROM SedeInfo s WHERE s.idSede = :idSede"), @NamedQuery(name = "SedeInfo.findByNomSede", query = "SELECT s FROM SedeInfo s WHERE s.nomSede = :nomSede")})
public class SedeInfo implements Serializable {
    private static final long serialVersionUID = 8302958415108137117L;

    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @Id
    @Basic(optional = false)
    @Column(name = "id_sede")
    private Integer idSede;
    @Basic(optional = false)
    @Column(name = "nom_sede")
    private String nomSede;
    @OneToMany(mappedBy = "sede")
    private Collection<EdificioInfo> edificioInfoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sedeZona")
    private Collection<ZonaInfo> zonaInfoCollection;

    public SedeInfo() {
    }

    public SedeInfo(Integer idSede) {
        this.idSede = idSede;
    }

    public SedeInfo(Integer idSede, String nomSede) {
        this.idSede = idSede;
        this.nomSede = nomSede;
    }

    public Integer getIdSede() {
        return idSede;
    }

    public void setIdSede(Integer idSede) {
        Integer oldIdSede = this.idSede;
        this.idSede = idSede;
        changeSupport.firePropertyChange("idSede", oldIdSede, idSede);
    }

    public String getNomSede() {
        return nomSede;
    }

    public void setNomSede(String nomSede) {
        String oldNomSede = this.nomSede;
        this.nomSede = nomSede;
        changeSupport.firePropertyChange("nomSede", oldNomSede, nomSede);
    }

    public Collection<EdificioInfo> getEdificioInfoCollection() {
        return edificioInfoCollection;
    }

    public void setEdificioInfoCollection(Collection<EdificioInfo> edificioInfoCollection) {
        this.setEdificioInfoCollection(edificioInfoCollection);
    }

    public Collection<ZonaInfo> getZonaInfoCollection() {
        return zonaInfoCollection;
    }

    public void setZonaInfoCollection(Collection<ZonaInfo> zonaInfoCollection) {
        this.zonaInfoCollection = zonaInfoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSede != null ? idSede.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SedeInfo)) {
            return false;
        }
        SedeInfo other = (SedeInfo) object;
        if ((this.idSede == null && other.idSede != null) || (this.idSede != null && !this.idSede.equals(other.idSede))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.SedeInfo[idSede=" + idSede + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
}
