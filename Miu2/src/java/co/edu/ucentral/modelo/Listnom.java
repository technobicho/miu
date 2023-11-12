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
 * Clase que define la persistencia para el objeto listnom
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "listnom")
@NamedQueries({@NamedQuery(name = "Listnom.findAll", query = "SELECT l FROM Listnom l"), @NamedQuery(name = "Listnom.findByIde", query = "SELECT l FROM Listnom l WHERE l.ide = :ide"), @NamedQuery(name = "Listnom.findByNombre", query = "SELECT l FROM Listnom l WHERE lower(l.nombre) LIKE :nombre"), @NamedQuery(name = "Listnom.findByTipo", query = "SELECT l FROM Listnom l WHERE l.tipo = :tipo")})
public class Listnom implements Serializable {
    private static final long serialVersionUID = -7371267613110073249L;
    
    @Column(name = "ide")
    @Id
    private Integer ide;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "tipo")
    private Integer tipo;

    public Listnom() {
    }

    public Integer getIde() {
        return ide;
    }

    public void setIde(Integer ide) {
        this.ide = ide;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

}
