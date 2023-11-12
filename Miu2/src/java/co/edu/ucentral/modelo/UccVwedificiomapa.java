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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Clase que define la persistencia para la vista proporcionada por universitas
 * para la informacion de edificios
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "UCC_VWEDIFICIOMAPA")
@NamedQueries({@NamedQuery(name = "UccVwedificiomapa.findAll", query = "SELECT u FROM UccVwedificiomapa u"), @NamedQuery(name = "UccVwedificiomapa.findByIdsalon", query = "SELECT u FROM UccVwedificiomapa u WHERE u.idsalon = :idsalon"), @NamedQuery(name = "UccVwedificiomapa.findBySalon", query = "SELECT u FROM UccVwedificiomapa u WHERE u.salon = :salon"), @NamedQuery(name = "UccVwedificiomapa.findByIdedificio", query = "SELECT u FROM UccVwedificiomapa u WHERE u.idedificio = :idedificio"), @NamedQuery(name = "UccVwedificiomapa.findByNombreedificio", query = "SELECT u FROM UccVwedificiomapa u WHERE u.nombreedificio = :nombreedificio"), @NamedQuery(name = "UccVwedificiomapa.findByCodigosede", query = "SELECT u FROM UccVwedificiomapa u WHERE u.codigosede = :codigosede"), @NamedQuery(name = "UccVwedificiomapa.findByNombresede", query = "SELECT u FROM UccVwedificiomapa u WHERE u.nombresede = :nombresede")})
public class UccVwedificiomapa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "IDSALON")
    private String idsalon;
    @Column(name = "SALON")
    private String salon;
    @Basic(optional = false)
    @Column(name = "IDEDIFICIO")
    @Id
    private String idedificio;
    @Column(name = "NOMBREEDIFICIO")
    private String nombreedificio;
    @Basic(optional = false)
    @Column(name = "CODIGOSEDE")
    private String codigosede;
    @Basic(optional = false)
    @Column(name = "NOMBRESEDE")
    private String nombresede;

    public UccVwedificiomapa() {
    }

    public String getIdsalon() {
        return idsalon;
    }

    public void setIdsalon(String idsalon) {
        this.idsalon = idsalon;
    }

    public String getSalon() {
        return salon;
    }

    public void setSalon(String salon) {
        this.salon = salon;
    }

    public String getIdedificio() {
        return idedificio;
    }

    public void setIdedificio(String idedificio) {
        this.idedificio = idedificio;
    }

    public String getNombreedificio() {
        return nombreedificio;
    }

    public void setNombreedificio(String nombreedificio) {
        this.nombreedificio = nombreedificio;
    }

    public String getCodigosede() {
        return codigosede;
    }

    public void setCodigosede(String codigosede) {
        this.codigosede = codigosede;
    }

    public String getNombresede() {
        return nombresede;
    }

    public void setNombresede(String nombresede) {
        this.nombresede = nombresede;
    }

}
