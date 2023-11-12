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
 * Clase que define la persistencia para la lista docente
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "listdocente")
@NamedQueries({@NamedQuery(name = "Listdocente.findAll", query = "SELECT l FROM Listdocente l"), @NamedQuery(name = "Listdocente.findByIdDocente", query = "SELECT l FROM Listdocente l WHERE l.idDocente = :idDocente"), @NamedQuery(name = "Listdocente.findByNombre", query = "SELECT l FROM Listdocente l WHERE lower(l.nombre) LIKE :nombre")})
public class Listdocente implements Serializable {
    private static final long serialVersionUID = -2334309370908268519L;
    
    @Column(name = "id_docente")
    @Id
    private Integer idDocente;
    @Column(name = "nombre")
    private String nombre;

    public Listdocente() {
    }

    public Integer getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(Integer idDocente) {
        this.idDocente = idDocente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
