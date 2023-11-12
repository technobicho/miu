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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author techno
 */
@Entity
@Table(name = "tipo_zona")
@NamedQueries({@NamedQuery(name = "TipoZona.findAll", query = "SELECT t FROM TipoZona t"), @NamedQuery(name = "TipoZona.findByIdTipoZona", query = "SELECT t FROM TipoZona t WHERE t.idTipoZona = :idTipoZona"), @NamedQuery(name = "TipoZona.findByNomTipoZona", query = "SELECT t FROM TipoZona t WHERE t.nomTipoZona = :nomTipoZona")})
public class TipoZona implements Serializable {
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    private static final long serialVersionUID = -7085183104195065520L;


    @SequenceGenerator(name="TIPO_ZONA", sequenceName="TIPO_SEQ")
    @Id
    @GeneratedValue(generator="TIPO_ZONA")
    @Basic(optional = false)
    @Column(name = "id_tipo_zona")
    private Integer idTipoZona;
    @Basic(optional = false)
    @Column(name = "nom_tipo_zona")
    private String nomTipoZona;
     @OneToMany(mappedBy = "tipo")
    private Collection<ZonaInfo> zonaInfoCollection;

    public TipoZona() {
    }

    public TipoZona(Integer idTipoZona) {
        this.idTipoZona = idTipoZona;
    }

    public TipoZona(Integer idTipoZona, String nomTipoZona) {
        this.idTipoZona = idTipoZona;
        this.nomTipoZona = nomTipoZona;
    }

    public Integer getIdTipoZona() {
        return idTipoZona;
    }

    public void setIdTipoZona(Integer idTipoZona) {
        Integer oldIdTipoZona = this.idTipoZona;
        this.idTipoZona = idTipoZona;
        changeSupport.firePropertyChange("idTipoZona", oldIdTipoZona, idTipoZona);
    }

    public String getNomTipoZona() {
        return nomTipoZona;
    }

    public void setNomTipoZona(String nomTipoZona) {
        String oldNomTipoZona = this.nomTipoZona;
        this.nomTipoZona = nomTipoZona;
        changeSupport.firePropertyChange("nomTipoZona", oldNomTipoZona, nomTipoZona);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoZona != null ? idTipoZona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoZona)) {
            return false;
        }
        TipoZona other = (TipoZona) object;
        if ((this.idTipoZona == null && other.idTipoZona != null) || (this.idTipoZona != null && !this.idTipoZona.equals(other.idTipoZona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.dao.TipoZona[idTipoZona=" + idTipoZona + "]";
    }

    /**
     * @return the zonaInfoCollection
     */
    public Collection<ZonaInfo> getZonaInfoCollection() {
        return zonaInfoCollection;
    }

    /**
     * @param zonaInfoCollection the zonaInfoCollection to set
     */
    public void setZonaInfoCollection(Collection<ZonaInfo> zonaInfoCollection) {
        this.zonaInfoCollection = zonaInfoCollection;
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

}
