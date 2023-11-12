/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Clase que define la persistencia para el objeto Espacios
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "espacios")
@NamedQueries({@NamedQuery(name = "Espacios.findAll", query = "SELECT e FROM Espacios e"), @NamedQuery(name = "Espacios.findByIdEdificio", query = "SELECT e FROM Espacios e WHERE e.id.idEdificio = :idEdificio"), @NamedQuery(name = "Espacios.findByNomEdificio", query = "SELECT e FROM Espacios e WHERE e.nomEdificio = :nomEdificio"), @NamedQuery(name = "Espacios.findByIdEdfPiso", query = "SELECT e FROM Espacios e WHERE e.id.idEdfPiso = :idEdfPiso"), @NamedQuery(name = "Espacios.findByNomPiso", query = "SELECT e FROM Espacios e WHERE e.nomPiso = :nomPiso"), @NamedQuery(name = "Espacios.findByIdEdfEspacio", query = "SELECT e FROM Espacios e WHERE e.id.idEdfEspacio = :idEdfEspacio"), @NamedQuery(name = "Espacios.findByNomEspacio", query = "SELECT e FROM Espacios e WHERE e.nomEspacio = :nomEspacio"), @NamedQuery(name = "Espacios.findByIdSede", query = "SELECT e FROM Espacios e WHERE e.idSede = :idSede"), @NamedQuery(name = "Espacios.findByNomSede", query = "SELECT e FROM Espacios e WHERE e.nomSede = :nomSede"), @NamedQuery(name = "Espacios.findByNomTipoEspacio", query = "SELECT e FROM Espacios e WHERE e.nomTipoEspacio = :nomTipoEspacio")})
public class Espacios implements Serializable {
    private static final long serialVersionUID = 1386996898821718819L;

    @EmbeddedId
    private EspaciosPK id;
    @Column(name = "nom_edificio")
    private String nomEdificio;
    @Column(name = "nom_piso")
    private String nomPiso;
    @Column(name = "id_edf_espacio")
    private Integer idEdfEspacio;
    @Column(name = "nom_espacio")
    private String nomEspacio;
    @Column(name = "id_sede")
    private Integer idSede;
    @Column(name = "nom_sede")
    private String nomSede;
    @Column(name = "nom_tipo_espacio")
    private String nomTipoEspacio;
    

    public Espacios() {
    }

    public Espacios(int idEdificio, int idEdfPiso, int idEdfEspacio) {
        this.id = new EspaciosPK(idEdificio, idEdfPiso, idEdfEspacio);
    }


    public String getNomPiso() {
        return nomPiso;
    }

    public void setNomPiso(String nomPiso) {
        this.nomPiso = nomPiso;
    }

    public Integer getIdEdfEspacio() {
        return idEdfEspacio;
    }

    public void setIdEdfEspacio(Integer idEdfEspacio) {
        this.idEdfEspacio = idEdfEspacio;
    }

    public String getNomEspacio() {
        return nomEspacio;
    }

    public void setNomEspacio(String nomEspacio) {
        this.nomEspacio = nomEspacio;
    }

    public Integer getIdSede() {
        return idSede;
    }

    public void setIdSede(Integer idSede) {
        this.idSede = idSede;
    }

    public String getNomSede() {
        return nomSede;
    }

    public void setNomSede(String nomSede) {
        this.nomSede = nomSede;
    }

    public String getNomTipoEspacio() {
        return nomTipoEspacio;
    }

    public void setNomTipoEspacio(String nomTipoEspacio) {
        this.nomTipoEspacio = nomTipoEspacio;
    }

    /**
     * @return the id
     */
    public EspaciosPK getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(EspaciosPK id) {
        this.id = id;
    }

    /**
     * @return the nomEdificio
     */
    public String getNomEdificio() {
        return nomEdificio;
    }

    /**
     * @param nomEdificio the nomEdificio to set
     */
    public void setNomEdificio(String nomEdificio) {
        this.nomEdificio = nomEdificio;
    }
}
