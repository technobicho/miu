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
 * Clase que define la persistencia para el objeto EdfLocaliza
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edf_localiza")
@NamedQueries({@NamedQuery(name = "EdfLocaliza.findAll", query = "SELECT e FROM EdfLocaliza e"), @NamedQuery(name = "EdfLocaliza.findByIdEdifici", query = "SELECT e FROM EdfLocaliza e WHERE e.idEdifici = :idEdifici"), @NamedQuery(name = "EdfLocaliza.findByNomEdificio", query = "SELECT e FROM EdfLocaliza e WHERE e.nomEdificio = :nomEdificio"), @NamedQuery(name = "EdfLocaliza.findByX", query = "SELECT e FROM EdfLocaliza e WHERE e.x = :x"), @NamedQuery(name = "EdfLocaliza.findByY", query = "SELECT e FROM EdfLocaliza e WHERE e.y = :y")})
public class EdfLocaliza implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "id_edifici")
    @Id
    private Integer idEdifici;
    @Column(name = "nom_edificio")
    private String nomEdificio;
    @Column(name = "x")
    private Double x;
    @Column(name = "y")
    private Double y;

    public EdfLocaliza() {
    }

    public Integer getIdEdifici() {
        return idEdifici;
    }

    public void setIdEdifici(Integer idEdifici) {
        this.idEdifici = idEdifici;
    }

    public String getNomEdificio() {
        return nomEdificio;
    }

    public void setNomEdificio(String nomEdificio) {
        this.nomEdificio = nomEdificio;
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
