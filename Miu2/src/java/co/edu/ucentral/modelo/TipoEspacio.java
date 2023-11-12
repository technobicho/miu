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
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Clase que define la persistencia del objeto  tipo espacio
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "tipo_espacio")
@NamedQueries({@NamedQuery(name = "TipoEspacio.findAll", query = "SELECT t FROM TipoEspacio t"), @NamedQuery(name = "TipoEspacio.findByIdTipoEspacio", query = "SELECT t FROM TipoEspacio t WHERE t.idTipoEspacio = :idTipoEspacio"), @NamedQuery(name = "TipoEspacio.findByNomTipoEspacio", query = "SELECT t FROM TipoEspacio t WHERE t.nomTipoEspacio = :nomTipoEspacio")})
public class TipoEspacio implements Serializable {
    private static final long serialVersionUID = 987000317430140325L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    @SequenceGenerator(name="TIPO_GEN",sequenceName="TIPO_SEQ")

    @Id
    @GeneratedValue(generator="TIPO_GEN")
    @Basic(optional = false)
    @Column(name = "id_tipo_espacio")
    private Integer idTipoEspacio;
    @Basic(optional = false)
    @Column(name = "nom_tipo_espacio")
    private String nomTipoEspacio;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "espacioTipo")
    private Collection<EdificioEspacio> edificioEspacioCollection;

    public TipoEspacio() {
    }

    public TipoEspacio(Integer idTipoEspacio) {
        this.idTipoEspacio = idTipoEspacio;
    }

    public TipoEspacio(Integer idTipoEspacio, String nomTipoEspacio) {
        this.idTipoEspacio = idTipoEspacio;
        this.nomTipoEspacio = nomTipoEspacio;
    }

    public Integer getIdTipoEspacio() {
        return idTipoEspacio;
    }

    public void setIdTipoEspacio(Integer idTipoEspacio) {
        Integer oldIdTipoEspacio = this.idTipoEspacio;
        this.idTipoEspacio = idTipoEspacio;
        changeSupport.firePropertyChange("idTipoEspacio", oldIdTipoEspacio, idTipoEspacio);
    }

    public String getNomTipoEspacio() {
        return nomTipoEspacio;
    }

    public void setNomTipoEspacio(String nomTipoEspacio) {
        String oldNomTipoEspacio = this.nomTipoEspacio;
        this.nomTipoEspacio = nomTipoEspacio;
        changeSupport.firePropertyChange("nomTipoEspacio", oldNomTipoEspacio, nomTipoEspacio);
    }

    public Collection<EdificioEspacio> getEdificioEspacioCollection() {
        return edificioEspacioCollection;
    }

    public void setEdificioEspacioCollection(Collection<EdificioEspacio> edificioEspacioCollection) {
        this.edificioEspacioCollection = edificioEspacioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoEspacio != null ? idTipoEspacio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoEspacio)) {
            return false;
        }
        TipoEspacio other = (TipoEspacio) object;
        if ((this.idTipoEspacio == null && other.idTipoEspacio != null) || (this.idTipoEspacio != null && !this.idTipoEspacio.equals(other.idTipoEspacio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.TipoEspacio[idTipoEspacio=" + idTipoEspacio + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

}
