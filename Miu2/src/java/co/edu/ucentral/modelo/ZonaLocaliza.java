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
 * Clase que define la persistencia para el objteo zona localiza
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "zona_localiza")
@NamedQueries({@NamedQuery(name = "ZonaLocaliza.findAll", query = "SELECT z FROM ZonaLocaliza z"), @NamedQuery(name = "ZonaLocaliza.findByIdZona", query = "SELECT z FROM ZonaLocaliza z WHERE z.idZona = :idZona"), @NamedQuery(name = "ZonaLocaliza.findByNomZona", query = "SELECT z FROM ZonaLocaliza z WHERE z.nomZona = :nomZona"), @NamedQuery(name = "ZonaLocaliza.findByX", query = "SELECT z FROM ZonaLocaliza z WHERE z.x = :x"), @NamedQuery(name = "ZonaLocaliza.findByY", query = "SELECT z FROM ZonaLocaliza z WHERE z.y = :y")})
public class ZonaLocaliza implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "id_zona")
    @Id
    private Integer idZona;
    @Column(name = "nom_zona")
    private String nomZona;
    @Column(name = "x")
    private Double x;
    @Column(name = "y")
    private Double y;

    public ZonaLocaliza() {
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
