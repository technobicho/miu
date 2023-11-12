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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author David Acosta
 */
@Entity
@Table(name = "zona_info")
@NamedQueries({@NamedQuery(name = "ZonaInfo.findAll", query = "SELECT z FROM ZonaInfo z"), @NamedQuery(name = "ZonaInfo.findByIdZona", query = "SELECT z FROM ZonaInfo z WHERE z.idZona = :idZona"), @NamedQuery(name = "ZonaInfo.findByNomZona", query = "SELECT z FROM ZonaInfo z WHERE z.nomZona = :nomZona")})
public class ZonaInfo implements Serializable {
    private static final long serialVersionUID = 7034245503906406524L;

    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @Id
    @Basic(optional = false)
    @Column(name = "id_zona")
    private Integer idZona;
    @Column(name = "nom_zona")
    private String nomZona;
    @JoinColumn(name = "sede_zona", referencedColumnName = "id_sede")
    @ManyToOne(optional = false)
    private SedeInfo sedeZona;
    @JoinColumn(name = "tipo", referencedColumnName = "id_tipo_zona")
    @ManyToOne(optional = false)
    private TipoZona tipo;

    public ZonaInfo() {
    }

    public ZonaInfo(Integer idZona) {
        this.idZona = idZona;
    }

    public ZonaInfo(Integer idZona, String nomZona, SedeInfo sedeZona) {
        this.idZona = idZona;
        this.nomZona = nomZona;
        this.sedeZona = sedeZona;
    }

    public Integer getIdZona() {
        return idZona;
    }

    public void setIdZona(Integer idZona) {
       Integer oldIdZona = this.idZona;
       this.idZona = idZona;
       changeSupport.firePropertyChange("idZona", oldIdZona, idZona);
    }

    public String getNomZona() {
        return nomZona;
    }

    public void setNomZona(String nomZona) {
        String oldNomZona = this.nomZona;
        this.nomZona = nomZona;
        changeSupport.firePropertyChange("nomZona", oldNomZona, nomZona);
    }

    public SedeInfo getSedeZona() {
        return sedeZona;
    }

    public void setSedeZona(SedeInfo sedeZona) {
        SedeInfo oldSedeZona = this.sedeZona;
        this.sedeZona = sedeZona;
        changeSupport.firePropertyChange("sedeZona", oldSedeZona, sedeZona);
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
        return "mapaadmin.ZonaInfo[idZona=" + idZona + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the tipo
     */
    public TipoZona getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(TipoZona tipo) {
        TipoZona oldTipoZona = this.tipo;
        this.tipo = tipo;
        changeSupport.firePropertyChange("tipoZona", oldTipoZona, tipo);
    }
}
