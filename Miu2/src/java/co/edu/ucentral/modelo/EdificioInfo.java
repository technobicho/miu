/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.modelo;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * Clase que define la persistencia para el objeto EdificioInfo
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edificio_info", catalog = "ucentral2", schema = "public")
@NamedQueries({@NamedQuery(name = "EdificioInfo.findAll", query = "SELECT e FROM EdificioInfo e ORDER BY e.nomEdificio"), @NamedQuery(name = "EdificioInfo.findByIdEdificio", query = "SELECT e FROM EdificioInfo e WHERE e.idEdificio = :idEdificio"), @NamedQuery(name = "EdificioInfo.findByNomEdificio", query = "SELECT e FROM EdificioInfo e WHERE e.nomEdificio = :nomEdificio"), @NamedQuery(name = "EdificioInfo.findByDireccion1", query = "SELECT e FROM EdificioInfo e WHERE e.direccion1 = :direccion1"), @NamedQuery(name = "EdificioInfo.findByDireccion2", query = "SELECT e FROM EdificioInfo e WHERE e.direccion2 = :direccion2"), @NamedQuery(name = "EdificioInfo.findByFechaConstruccion", query = "SELECT e FROM EdificioInfo e WHERE e.fechaConstruccion = :fechaConstruccion"), @NamedQuery(name = "EdificioInfo.findByCiudad", query = "SELECT e FROM EdificioInfo e WHERE e.ciudad = :ciudad"), @NamedQuery(name = "EdificioInfo.findBySede", query = "SELECT e FROM EdificioInfo e WHERE e.sede = :sede ORDER BY e.nomEdificio"), @NamedQuery(name = "EdificioInfo.findByDescripcion", query = "SELECT e FROM EdificioInfo e WHERE e.descripcion = :descripcion")})
public class EdificioInfo implements Serializable {

    private static final long serialVersionUID = 2970941205196375487L;
    @Transient
    private PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);
    @Id
    @Basic(optional = false)
    @Column(name = "id_edificio")
    private Integer idEdificio;
    @Basic(optional = false)
    @Column(name = "nom_edificio")
    private String nomEdificio;
    @Column(name = "direccion_1")
    private String direccion1;
    @Column(name = "direccion_2")
    private String direccion2;
    @Column(name = "fecha_construccion")
    @Temporal(TemporalType.DATE)
    private Date fechaConstruccion;
    @JoinColumn(name = "ciudad", referencedColumnName = "id_ciudad")
    @ManyToOne(optional = false)
    private Ciudad ciudad;
    @JoinColumn(name = "sede", referencedColumnName = "id_sede")
    @ManyToOne(optional = false)
    private SedeInfo sede;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "fotografia")
    private String fotografia;
    @JoinColumn(name = "uso", referencedColumnName = "id_tipo_uso")
    @ManyToOne(optional = false)
    private TipoUso uso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEdificio")
    private List<EdificioPiso> edificioPisoCollection;
    @Lob
    @Column(name = "foto")
    private byte[] picture;

    public EdificioInfo() {
    }

    public EdificioInfo(Integer idEdificio) {
        this.idEdificio = idEdificio;
    }

    public EdificioInfo(Integer idEdificio, String nomEdificio, Ciudad ciudad) {
        this.idEdificio = idEdificio;
        this.nomEdificio = nomEdificio;
        this.ciudad = ciudad;
    }

    public Integer getIdEdificio() {
        return idEdificio;
    }

    public void setIdEdificio(Integer idEdificio) {
        Integer oldIdEdificio = this.idEdificio;
        this.idEdificio = idEdificio;
        changeSupport.firePropertyChange("idEdificio", oldIdEdificio, idEdificio);
    }

    public String getNomEdificio() {
        return nomEdificio;
    }

    public void setNomEdificio(String nomEdificio) {
        String oldNomEdificio = this.nomEdificio;
        this.nomEdificio = nomEdificio;
        changeSupport.firePropertyChange("nomEdificio", oldNomEdificio, nomEdificio);
    }

    public String getDireccion1() {
        return direccion1;
    }

    public void setDireccion1(String direccion1) {
        String oldDireccion1 = this.direccion1;
        this.direccion1 = direccion1;
        changeSupport.firePropertyChange("direccion1", oldDireccion1, direccion1);
    }

    public String getDireccion2() {
        return direccion2;
    }

    public void setDireccion2(String direccion2) {
        String oldDireccion2 = this.direccion2;
        this.direccion2 = direccion2;
        changeSupport.firePropertyChange("direccion2", oldDireccion2, direccion2);
    }

    public Date getFechaConstruccion() {
        return fechaConstruccion;
    }

    public void setFechaConstruccion(Date fechaConstruccion) {
        Date oldFechaConstruccion = this.fechaConstruccion;
        this.fechaConstruccion = fechaConstruccion;
        changeSupport.firePropertyChange("fechaConstruccion", oldFechaConstruccion, fechaConstruccion);
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        Ciudad oldCiudad = this.ciudad;
        this.ciudad = ciudad;
        changeSupport.firePropertyChange("ciudad", oldCiudad, ciudad);
    }

    public SedeInfo getSede() {
        return sede;
    }

    public void setSede(SedeInfo sede) {
        SedeInfo oldSede = this.sede;
        this.sede = sede;
        changeSupport.firePropertyChange("sede", oldSede, sede);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        String oldDescripcion = this.descripcion;
        this.descripcion = descripcion;
        changeSupport.firePropertyChange("descripcion", oldDescripcion, descripcion);
    }

    public String getFotografia() {
        return fotografia;
    }

    public void setFotografia(String fotografia) {
        String oldFotografia = this.fotografia;
        this.fotografia = fotografia;
        changeSupport.firePropertyChange("fotografia", oldFotografia, fotografia);
    }

    public List<EdificioPiso> getEdificioPisoCollection() {
        return edificioPisoCollection;
    }

    public void setEdificioPisoCollection(List<EdificioPiso> edificioPisoCollection) {
        this.edificioPisoCollection = edificioPisoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEdificio != null ? idEdificio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EdificioInfo)) {
            return false;
        }
        EdificioInfo other = (EdificioInfo) object;
        if ((this.idEdificio == null && other.idEdificio != null) || (this.idEdificio != null && !this.idEdificio.equals(other.idEdificio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mapaadmin.EdificioInfo[idEdificio=" + idEdificio + "]";
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    /**
     * @return the uso
     */
    public TipoUso getUso() {
        return uso;
    }

    /**
     * @param uso the uso to set
     */
    public void setUso(TipoUso uso) {
        TipoUso oldUso = this.uso;
        this.uso = uso;
        changeSupport.firePropertyChange("uso", oldUso, uso);
    }

    /**
     * @return the picture
     */
    public byte[] getPicture() {
        return picture;
    }

    /**
     * @param picture the picture to set
     */
    public void setPicture(byte[] picture) {
        byte[] oldPicture = this.picture;
        this.picture = picture;
        changeSupport.firePropertyChange("picture", oldPicture, picture);
    }
}
