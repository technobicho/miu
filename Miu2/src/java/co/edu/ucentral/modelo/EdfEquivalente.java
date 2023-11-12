/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Clase que define la persistencia para el objeto EdfEquivalente
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edf_equivalente")
@NamedQueries({@NamedQuery(name = "EdfEquivalente.findAll", query = "SELECT e FROM EdfEquivalente e"), @NamedQuery(name = "EdfEquivalente.findByIdEdificioMiu", query = "SELECT e FROM EdfEquivalente e WHERE e.idEdificioMiu = :idEdificioMiu"), @NamedQuery(name = "EdfEquivalente.findByIdEdfUniversitas", query = "SELECT e FROM EdfEquivalente e WHERE e.idEdfUniversitas = :idEdfUniversitas")})
public class EdfEquivalente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_edificio_miu")
    private Integer idEdificioMiu;
    @Basic(optional = false)
    @Column(name = "id_edf_universitas")
    private String idEdfUniversitas;
    @JoinColumn(name = "id_edificio_miu", referencedColumnName = "id_edificio", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private EdificioInfo edificioInfo;

    public EdfEquivalente() {
    }

    public EdfEquivalente(Integer idEdificioMiu) {
        this.idEdificioMiu = idEdificioMiu;
    }

    public EdfEquivalente(Integer idEdificioMiu, String idEdfUniversitas) {
        this.idEdificioMiu = idEdificioMiu;
        this.idEdfUniversitas = idEdfUniversitas;
    }

    public Integer getIdEdificioMiu() {
        return idEdificioMiu;
    }

    public void setIdEdificioMiu(Integer idEdificioMiu) {
        this.idEdificioMiu = idEdificioMiu;
    }

    public String getIdEdfUniversitas() {
        return idEdfUniversitas;
    }

    public void setIdEdfUniversitas(String idEdfUniversitas) {
        this.idEdfUniversitas = idEdfUniversitas;
    }

    public EdificioInfo getEdificioInfo() {
        return edificioInfo;
    }

    public void setEdificioInfo(EdificioInfo edificioInfo) {
        this.edificioInfo = edificioInfo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEdificioMiu != null ? idEdificioMiu.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EdfEquivalente)) {
            return false;
        }
        EdfEquivalente other = (EdfEquivalente) object;
        if ((this.idEdificioMiu == null && other.idEdificioMiu != null) || (this.idEdificioMiu != null && !this.idEdificioMiu.equals(other.idEdificioMiu))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.EdfEquivalente[idEdificioMiu=" + idEdificioMiu + "]";
    }

}
