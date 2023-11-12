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
 * Clase que define la persistencia del objeto CargoFuncionario
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "cargo_funcionario")
@NamedQueries({@NamedQuery(name = "CargoFuncionario.findAll", query = "SELECT c FROM CargoFuncionario c"), @NamedQuery(name = "CargoFuncionario.findByIdCargo", query = "SELECT c FROM CargoFuncionario c WHERE c.idCargo = :idCargo"), @NamedQuery(name = "CargoFuncionario.findByNomCargo", query = "SELECT c FROM CargoFuncionario c WHERE c.nomCargo = :nomCargo")})
public class CargoFuncionario implements Serializable {
    private static final long serialVersionUID = 2119238875677385740L;

    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @SequenceGenerator(name = "CARGO_GEN", sequenceName = "CARGO_SEQ")
    @Id
    @GeneratedValue(generator = "CARGO_GEN")
    @Basic(optional = false)
    @Column(name = "id_cargo")
    private Integer idCargo;
    @Basic(optional = false)
    @Column(name = "nom_cargo")
    private String nomCargo;
    @OneToMany(mappedBy = "cargo")
    private Collection<Funcionario> funcionarioCollection;
    @JoinColumn(name = "tipo_cargo", referencedColumnName = "id_tipocargo")
    @ManyToOne(optional = false)
    private TipoCargo tipoCargo;

    public CargoFuncionario() {
    }

    public CargoFuncionario(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public CargoFuncionario(Integer idCargo, String nomCargo) {
        this.idCargo = idCargo;
        this.nomCargo = nomCargo;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        Integer oldIdCargo = this.idCargo;
        this.idCargo = idCargo;
        changeSupport.firePropertyChange("idCargo", oldIdCargo, idCargo);
    }

    public String getNomCargo() {
        return nomCargo;
    }

    public void setNomCargo(String nomCargo) {
        String oldNomCargo = this.nomCargo;
        this.nomCargo = nomCargo;
        changeSupport.firePropertyChange("nomCargo", oldNomCargo, nomCargo);
    }

    public Collection<Funcionario> getFuncionarioCollection() {
        return funcionarioCollection;
    }

    public void setFuncionarioCollection(Collection<Funcionario> funcionarioCollection) {
        this.funcionarioCollection = funcionarioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCargo != null ? idCargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CargoFuncionario)) {
            return false;
        }
        CargoFuncionario other = (CargoFuncionario) object;
        if ((this.idCargo == null && other.idCargo != null) || (this.idCargo != null && !this.idCargo.equals(other.idCargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.CargoFuncionario[idCargo=" + idCargo + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the tipoCargo
     */
    public TipoCargo getTipoCargo() {
        return tipoCargo;
    }

    /**
     * @param tipoCargo the tipoCargo to set
     */
    public void setTipoCargo(TipoCargo tipoCargo) {
        TipoCargo oldTipoCargo = this.tipoCargo;
        this.tipoCargo = tipoCargo;
        changeSupport.firePropertyChange("tipoCargo", oldTipoCargo, tipoCargo);
    }
}
