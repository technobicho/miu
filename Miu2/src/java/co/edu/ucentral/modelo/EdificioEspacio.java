/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;


import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Clase que define la persistencia para el objeto EdificioEspacio
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edificio_espacio", catalog = "ucentral2", schema = "public")
@NamedQueries({@NamedQuery(name = "EdificioEspacio.findAll", query = "SELECT e FROM EdificioEspacio e"), @NamedQuery(name = "EdificioEspacio.findByIdEdfEspacio", query = "SELECT e FROM EdificioEspacio e WHERE e.idEdfEspacio = :idEdfEspacio"), @NamedQuery(name = "EdificioEspacio.findByEspacioTipo", query = "SELECT e FROM EdificioEspacio e WHERE e.espacioTipo = :espacioTipo"), @NamedQuery(name = "EdificioEspacio.findByNomEspacio", query = "SELECT e FROM EdificioEspacio e WHERE e.nomEspacio = :nomEspacio")})
public class EdificioEspacio implements Serializable {
    private static final long serialVersionUID = -2964040822695175560L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    @SequenceGenerator(name="ESPACIO_GEN",sequenceName="ESPACIO_SEQ")

    @Id
    @GeneratedValue(generator="ESPACIO_GEN")
    @Basic(optional = false)
    @Column(name = "id_edf_espacio")
    private Integer idEdfEspacio;
    @JoinColumn(name = "tipo_espacio", referencedColumnName = "id_tipo_espacio")
    @ManyToOne(optional = false)
    private TipoEspacio espacioTipo;
    @Basic(optional = false)
    @Column(name = "nom_espacio")
    private String nomEspacio;
    @JoinColumn(name = "id_piso", referencedColumnName = "id_edf_piso")
    @ManyToOne(optional = false)
    private EdificioPiso idPiso;
    @OneToMany(mappedBy = "edfEspacio")
    private List<Funcionario> funcionarioEspacioCollection;

    public EdificioEspacio() {
    }

    public EdificioEspacio(Integer idEdfEspacio) {
        this.idEdfEspacio = idEdfEspacio;
    }

    public EdificioEspacio(Integer idEdfEspacio, TipoEspacio espacioTipo, String nomEspacio) {
        this.idEdfEspacio = idEdfEspacio;
        this.espacioTipo = espacioTipo;
        this.nomEspacio = nomEspacio;
    }

    public Integer getIdEdfEspacio() {
        return idEdfEspacio;
    }

    public void setIdEdfEspacio(Integer idEdfEspacio) {
        Integer oldIdEdfEspacio = this.idEdfEspacio;
        this.idEdfEspacio = idEdfEspacio;
        changeSupport.firePropertyChange("idEdfEspacio", oldIdEdfEspacio, idEdfEspacio);
    }

    public TipoEspacio getEspacioTipo() {
        return espacioTipo;
    }

    public void setEspacioTipo(TipoEspacio espacioTipo) {
        TipoEspacio oldEspacioTipo = this.espacioTipo;
        this.espacioTipo = espacioTipo;
        changeSupport.firePropertyChange("espacioTipo", oldEspacioTipo, espacioTipo);
    }

    public String getNomEspacio() {
        return nomEspacio;
    }

    public void setNomEspacio(String nomEspacio) {
        String oldNomEspacio = this.nomEspacio;
        this.nomEspacio = nomEspacio;
        changeSupport.firePropertyChange("nomEspacio", oldNomEspacio, nomEspacio);
    }

    public EdificioPiso getIdPiso() {
        return idPiso;
    }

    public void setIdPiso(EdificioPiso idPiso) {
        EdificioPiso oldIdPiso = this.idPiso;
        this.idPiso = idPiso;
        changeSupport.firePropertyChange("idPiso", oldIdPiso, idPiso);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEdfEspacio != null ? idEdfEspacio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EdificioEspacio)) {
            return false;
        }
        EdificioEspacio other = (EdificioEspacio) object;
        if ((this.idEdfEspacio == null && other.idEdfEspacio != null) || (this.idEdfEspacio != null && !this.idEdfEspacio.equals(other.idEdfEspacio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.EdificioEspacio[idEdfEspacio=" + idEdfEspacio + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the funcionarioEspacioCollection
     */
    public List<Funcionario> getFuncionarioEspacioCollection() {
        return funcionarioEspacioCollection;
    }

    /**
     * @param funcionarioEspacioCollection the funcionarioEspacioCollection to set
     */
    public void setFuncionarioEspacioCollection(List<Funcionario> funcionarioEspacioCollection) {
        this.funcionarioEspacioCollection = funcionarioEspacioCollection;
    }

}
