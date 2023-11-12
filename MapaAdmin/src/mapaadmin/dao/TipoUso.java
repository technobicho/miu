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
 * @author David Acosta
 */
@Entity
@Table(name = "tipo_uso")
@NamedQueries({@NamedQuery(name = "TipoUso.findAll", query = "SELECT t FROM TipoUso t"), @NamedQuery(name = "TipoUso.findByIdTipoUso", query = "SELECT t FROM TipoUso t WHERE t.idTipoUso = :idTipoUso"), @NamedQuery(name = "TipoUso.findByNomTipoUso", query = "SELECT t FROM TipoUso t WHERE t.nomTipoUso = :nomTipoUso")})
public class TipoUso implements Serializable {
    private static final long serialVersionUID = -6817703398122460886L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    @SequenceGenerator(name="USO_GEN",sequenceName="USO_SEQ")
    @Id
    @GeneratedValue(generator="USO_GEN")
    @Basic(optional = false)
    @Column(name = "id_tipo_uso")
    private Integer idTipoUso;
    @Basic(optional = false)
    @Column(name = "nom_tipo_uso")
    private String nomTipoUso;
    @OneToMany(mappedBy = "uso")
    private Collection<EdificioInfo> edificioUsoCollection;

    public TipoUso() {
    }

    public TipoUso(Integer idTipoUso) {
        this.idTipoUso = idTipoUso;
    }

    public TipoUso(Integer idTipoUso, String nomTipoUso) {
        this.idTipoUso = idTipoUso;
        this.nomTipoUso = nomTipoUso;
    }

    public Integer getIdTipoUso() {
        return idTipoUso;
    }

    public void setIdTipoUso(Integer idTipoUso) {
        Integer oldIdTipoUso = this.idTipoUso;
        this.idTipoUso = idTipoUso;
        changeSupport.firePropertyChange("idTipoUso", oldIdTipoUso, idTipoUso);
    }

    public String getNomTipoUso() {
        return nomTipoUso;
    }

    public void setNomTipoUso(String nomTipoUso) {
        String oldNomTipoUso = this.nomTipoUso;
        this.nomTipoUso = nomTipoUso;
        changeSupport.firePropertyChange("nomTipoUso", oldNomTipoUso, nomTipoUso);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoUso != null ? idTipoUso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoUso)) {
            return false;
        }
        TipoUso other = (TipoUso) object;
        if ((this.idTipoUso == null && other.idTipoUso != null) || (this.idTipoUso != null && !this.idTipoUso.equals(other.idTipoUso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.TipoUso[idTipoUso=" + idTipoUso + "]";
    }

    /**
     * @return the edificioUsoCollection
     */
    public Collection<EdificioInfo> getEdificioUsoCollection() {
        return edificioUsoCollection;
    }

    /**
     * @param edificioUsoCollection the edificioUsoCollection to set
     */
    public void setEdificioUsoCollection(Collection<EdificioInfo> edificioUsoCollection) {
        this.edificioUsoCollection = edificioUsoCollection;
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

}
