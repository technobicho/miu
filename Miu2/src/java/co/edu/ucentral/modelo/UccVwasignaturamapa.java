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
 * para la informacion de asignaturas
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "UCC_VWASIGNATURAMAPA")
@NamedQueries({@NamedQuery(name = "UccVwasignaturamapa.findAll", query = "SELECT u FROM UccVwasignaturamapa u"), @NamedQuery(name = "UccVwasignaturamapa.findByCodigoasignatura", query = "SELECT u FROM UccVwasignaturamapa u WHERE u.codigoasignatura = :codigoasignatura"), @NamedQuery(name = "UccVwasignaturamapa.findByNombreasignatura", query = "SELECT u FROM UccVwasignaturamapa u WHERE lower(u.nombreasignatura) LIKE :nombreasignatura")})
public class UccVwasignaturamapa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "CODIGOASIGNATURA")
    @Id
    private String codigoasignatura;
    @Basic(optional = false)
    @Column(name = "NOMBREASIGNATURA")
    private String nombreasignatura;

    public UccVwasignaturamapa() {
    }

    public String getCodigoasignatura() {
        return codigoasignatura;
    }

    public void setCodigoasignatura(String codigoasignatura) {
        this.codigoasignatura = codigoasignatura;
    }

    public String getNombreasignatura() {
        return nombreasignatura;
    }

    public void setNombreasignatura(String nombreasignatura) {
        this.nombreasignatura = nombreasignatura;
    }

}
