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
 * Clase que define la persistencia del objeto tipo_cargo
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "tipo_cargo")
@NamedQueries({@NamedQuery(name = "TipoCargo.findAll", query = "SELECT t FROM TipoCargo t"), @NamedQuery(name = "TipoCargo.findByIdTipocargo", query = "SELECT t FROM TipoCargo t WHERE t.idTipocargo = :idTipocargo"), @NamedQuery(name = "TipoCargo.findByNomTipocargo", query = "SELECT t FROM TipoCargo t WHERE t.nomTipocargo = :nomTipocargo")})
public class TipoCargo implements Serializable {
    private static final long serialVersionUID = -3872231912964394985L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    @SequenceGenerator(name="TIPO_CARG", sequenceName="TIPO_SEQ")
    @Id
    @GeneratedValue(generator="TIPO_CARG")
    @Basic(optional = false)
    @Column(name = "id_tipocargo")
    private Integer idTipocargo;
    @Basic(optional = false)
    @Column(name = "nom_tipocargo")
    private String nomTipocargo;
    @OneToMany(mappedBy = "tipoCargo")
    private Collection<CargoFuncionario> cargoFuncionarioCollection;

    public TipoCargo() {
    }

    public TipoCargo(Integer idTipocargo) {
        this.idTipocargo = idTipocargo;
    }

    public TipoCargo(Integer idTipocargo, String nomTipocargo) {
        this.idTipocargo = idTipocargo;
        this.nomTipocargo = nomTipocargo;
    }

    public Integer getIdTipocargo() {
        return idTipocargo;
    }

    public void setIdTipocargo(Integer idTipocargo) {
        Integer oldIdTipocargo = this.idTipocargo;
        this.idTipocargo = idTipocargo;
        changeSupport.firePropertyChange("idTipocargo", oldIdTipocargo, idTipocargo);
    }

    public String getNomTipocargo() {
        return nomTipocargo;
    }

    public void setNomTipocargo(String nomTipocargo) {
        String oldNomTipocargo = this.nomTipocargo;
        this.nomTipocargo = nomTipocargo;
        changeSupport.firePropertyChange("nomTipocargo", oldNomTipocargo, nomTipocargo);
    }

    public Collection<CargoFuncionario> getCargoFuncionarioCollection() {
        return cargoFuncionarioCollection;
    }

    public void setCargoFuncionarioCollection(Collection<CargoFuncionario> cargoFuncionarioCollection) {
        this.cargoFuncionarioCollection = cargoFuncionarioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipocargo != null ? idTipocargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoCargo)) {
            return false;
        }
        TipoCargo other = (TipoCargo) object;
        if ((this.idTipocargo == null && other.idTipocargo != null) || (this.idTipocargo != null && !this.idTipocargo.equals(other.idTipocargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.dao.TipoCargo[idTipocargo=" + idTipocargo + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

}
