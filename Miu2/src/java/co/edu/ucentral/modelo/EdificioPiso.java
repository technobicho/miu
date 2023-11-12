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
import javax.persistence.CascadeType;
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
 * Clase que define la persistencia para el objteo EdificioPiso
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edificio_piso", catalog = "ucentral2", schema = "public")
@NamedQueries({@NamedQuery(name = "EdificioPiso.findAll", query = "SELECT e FROM EdificioPiso e"), @NamedQuery(name = "EdificioPiso.findByIdEdfPiso", query = "SELECT e FROM EdificioPiso e WHERE e.idEdfPiso = :idEdfPiso"), @NamedQuery(name = "EdificioPiso.findByNomPiso", query = "SELECT e FROM EdificioPiso e WHERE e.nomPiso = :nomPiso"), @NamedQuery(name = "EdificioPiso.findByIdEdificio", query = "SELECT e FROM EdificioPiso e WHERE e.idEdificio = :idEdificio ORDER BY e.nomPiso")})
public class EdificioPiso implements Serializable {
    private static final long serialVersionUID = -37661060272970985L;

    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @SequenceGenerator(name = "PISO_GEN", sequenceName = "PISO_SEQ")
    @Id
    @GeneratedValue(generator = "PISO_GEN")
    @Basic(optional = false)
    @Column(name = "id_edf_piso")
    private Integer idEdfPiso;
    @Basic(optional = false)
    @Column(name = "nom_piso")
    private String nomPiso;
    @JoinColumn(name = "id_edificio", referencedColumnName = "id_edificio")
    @ManyToOne(optional = false)
    private EdificioInfo idEdificio;
    @Column(name = "plano")
    private String plano;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPiso")
    private List<EdificioEspacio> edificioEspacioCollection;

    public EdificioPiso() {
    }

    public EdificioPiso(Integer idEdfPiso) {
        this.idEdfPiso = idEdfPiso;
    }

    public EdificioPiso(Integer idEdfPiso, String nomPiso, EdificioInfo idEdificio) {
        this.idEdfPiso = idEdfPiso;
        this.nomPiso = nomPiso;
        this.idEdificio = idEdificio;
    }

    public Integer getIdEdfPiso() {
        return idEdfPiso;
    }

    public void setIdEdfPiso(Integer idEdfPiso) {
        Integer oldIdEdfPiso = this.idEdfPiso;
        this.idEdfPiso = idEdfPiso;
        changeSupport.firePropertyChange("idEdfPiso", oldIdEdfPiso, idEdfPiso);
    }

    public String getNomPiso() {
        return nomPiso;
    }

    public void setNomPiso(String nomPiso) {
        String oldNomPiso = this.nomPiso;
        this.nomPiso = nomPiso;
        changeSupport.firePropertyChange("nomPiso", oldNomPiso, nomPiso);
    }

    public EdificioInfo getIdEdificio() {
        return idEdificio;
    }

    public void setIdEdificio(EdificioInfo idEdificio) {
        EdificioInfo oldIdEdificio = this.idEdificio;
        this.idEdificio = idEdificio;
        changeSupport.firePropertyChange("idEdificio", oldIdEdificio, idEdificio);
    }

    public List<EdificioEspacio> getEdificioEspacioCollection() {
        return edificioEspacioCollection;
    }

    public void setEdificioEspacioCollection(List<EdificioEspacio> edificioEspacioCollection) {
        this.edificioEspacioCollection = edificioEspacioCollection;
    }

    public String getPlano() {
        return plano;
    }

    public void setPlano(String plano) {
        String oldPlano = this.plano;
        this.plano = plano;
        changeSupport.firePropertyChange("plano", oldPlano, plano);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEdfPiso != null ? idEdfPiso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EdificioPiso)) {
            return false;
        }
        EdificioPiso other = (EdificioPiso) object;
        if ((this.idEdfPiso == null && other.idEdfPiso != null) || (this.idEdfPiso != null && !this.idEdfPiso.equals(other.idEdfPiso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.EdificioPiso[idEdfPiso=" + idEdfPiso + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }
}
