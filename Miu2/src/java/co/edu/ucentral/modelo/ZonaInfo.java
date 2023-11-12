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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Clase que define la persistencia para el objeto zona info
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "zona_info")
@NamedQueries({@NamedQuery(name = "ZonaInfo.findAll", query = "SELECT z FROM ZonaInfo z"), @NamedQuery(name = "ZonaInfo.findByIdZona", query = "SELECT z FROM ZonaInfo z WHERE z.idZona = :idZona"), @NamedQuery(name = "ZonaInfo.findByNomZona", query = "SELECT z FROM ZonaInfo z WHERE z.nomZona = :nomZona"), @NamedQuery(name = "ZonaInfo.findByTipoZona", query = "SELECT z FROM ZonaInfo z WHERE z.tipo = :Tipo")})
public class ZonaInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_zona")
    private Integer idZona;
    @Column(name = "nom_zona")
    private String nomZona;
    @JoinColumn(name = "sede_zona", referencedColumnName = "id_sede")
    @ManyToOne
    private SedeInfo sedeZona;
    @JoinColumn(name = "tipo", referencedColumnName = "id_tipo_zona")
    @ManyToOne
    private TipoZona tipo;

    public ZonaInfo() {
    }

    public ZonaInfo(Integer idZona) {
        this.idZona = idZona;
    }

    public Integer getIdZona() {
        return idZona;
    }

    public void setIdZona(Integer idZona) {
        this.idZona = idZona;
    }

    public String getNomZona() {
        return nomZona;
    }

    public void setNomZona(String nomZona) {
        this.nomZona = nomZona;
    }

    public SedeInfo getSedeZona() {
        return sedeZona;
    }

    public void setSedeZona(SedeInfo sedeZona) {
        this.sedeZona = sedeZona;
    }

    public TipoZona getTipo() {
        return tipo;
    }

    public void setTipo(TipoZona tipo) {
        this.tipo = tipo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idZona != null ? idZona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ZonaInfo)) {
            return false;
        }
        ZonaInfo other = (ZonaInfo) object;
        if ((this.idZona == null && other.idZona != null) || (this.idZona != null && !this.idZona.equals(other.idZona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.ZonaInfo[idZona=" + idZona + "]";
    }

}
