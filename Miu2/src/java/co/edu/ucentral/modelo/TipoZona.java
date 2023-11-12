/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Clase que define la persistencia del objeto tipo zona
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "tipo_zona")
@NamedQueries({@NamedQuery(name = "TipoZona.findAll", query = "SELECT t FROM TipoZona t"), @NamedQuery(name = "TipoZona.findByIdTipoZona", query = "SELECT t FROM TipoZona t WHERE t.idTipoZona = :idTipoZona"), @NamedQuery(name = "TipoZona.findByNomTipoZona", query = "SELECT t FROM TipoZona t WHERE t.nomTipoZona = :nomTipoZona")})
public class TipoZona implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
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
        this.idTipoZona = idTipoZona;
    }

    public String getNomTipoZona() {
        return nomTipoZona;
    }

    public void setNomTipoZona(String nomTipoZona) {
        this.nomTipoZona = nomTipoZona;
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
        return "co.edu.ucentral.modelo.TipoZona[idTipoZona=" + idTipoZona + "]";
    }

}
