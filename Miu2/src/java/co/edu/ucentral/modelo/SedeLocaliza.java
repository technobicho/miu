/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Clase que define la persistencia del objeto sede localiza
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "sede_localiza")
@NamedQueries({@NamedQuery(name = "SedeLocaliza.findAll", query = "SELECT s FROM SedeLocaliza s"), @NamedQuery(name = "SedeLocaliza.findByIdSede", query = "SELECT s FROM SedeLocaliza s WHERE s.idSede = :idSede"), @NamedQuery(name = "SedeLocaliza.findByNomSede", query = "SELECT s FROM SedeLocaliza s WHERE s.nomSede = :nomSede"), @NamedQuery(name = "SedeLocaliza.findByX", query = "SELECT s FROM SedeLocaliza s WHERE s.x = :x"), @NamedQuery(name = "SedeLocaliza.findByY", query = "SELECT s FROM SedeLocaliza s WHERE s.y = :y")})
public class SedeLocaliza implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "id_sede")
    @Id
    private Integer idSede;
    @Column(name = "nom_sede")
    private String nomSede;
    @Column(name = "x")
    private Double x;
    @Column(name = "y")
    private Double y;

    public SedeLocaliza() {
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

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

}
