/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.dao;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author David Acosta
 */
@Entity
@Table(name = "funcionario")
@NamedQueries({@NamedQuery(name = "Funcionario.findAll", query = "SELECT f FROM Funcionario f"), @NamedQuery(name = "Funcionario.findByIdFuncionario", query = "SELECT f FROM Funcionario f WHERE f.idFuncionario = :idFuncionario"), @NamedQuery(name = "Funcionario.findByNomFuncionario", query = "SELECT f FROM Funcionario f WHERE f.nomFuncionario = :nomFuncionario")})
public class Funcionario implements Serializable {
    private static final long serialVersionUID = 25801762572768779L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    @SequenceGenerator(name="FUNC_GEN",sequenceName="FUNC_SEQ")
    @Id
    @GeneratedValue(generator="FUNC_GEN")
    @Basic(optional = false)
    @Column(name = "id_funcionario")
    private Integer idFuncionario;
    @Column(name = "nom_funcionario")
    private String nomFuncionario;
    @JoinColumn(name = "cargo", referencedColumnName = "id_cargo")
    @ManyToOne
    private CargoFuncionario cargo;
    @JoinColumn(name = "edf_espacio", referencedColumnName = "id_edf_espacio")
    @ManyToOne
    private EdificioEspacio edfEspacio;

    public Funcionario() {
    }

    public Funcionario(Integer idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public Integer getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(Integer idFuncionario) {
        Integer oldIdFuncionario = this.idFuncionario;
        this.idFuncionario = idFuncionario;
        changeSupport.firePropertyChange("idFuncionario", oldIdFuncionario, idFuncionario);
    }

    public String getNomFuncionario() {
        return nomFuncionario;
    }

    public void setNomFuncionario(String nomFuncionario) {
        String oldNomFuncionario = this.nomFuncionario;
        this.nomFuncionario = nomFuncionario;
        changeSupport.firePropertyChange("nomFuncionario", oldNomFuncionario, nomFuncionario);
    }

    public CargoFuncionario getCargo() {
        return cargo;
    }

    public void setCargo(CargoFuncionario cargo) {
        CargoFuncionario oldCargo = this.cargo;
        this.cargo = cargo;
        changeSupport.firePropertyChange("cargo", oldCargo, cargo);
    }

    public EdificioEspacio getEdfEspacio() {
        return edfEspacio;
    }

    public void setEdfEspacio(EdificioEspacio edfEspacio) {
        EdificioEspacio oldEdfEspacio = this.edfEspacio;
        this.edfEspacio = edfEspacio;
        changeSupport.firePropertyChange("edfEspacio", oldEdfEspacio, edfEspacio);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFuncionario != null ? idFuncionario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Funcionario)) {
            return false;
        }
        Funcionario other = (Funcionario) object;
        if ((this.idFuncionario == null && other.idFuncionario != null) || (this.idFuncionario != null && !this.idFuncionario.equals(other.idFuncionario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.Funcionario[idFuncionario=" + idFuncionario + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

}
