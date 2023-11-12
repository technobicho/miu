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
 * para la informacion de docentes
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "UCC_VWPROFESORMAPA")
@NamedQueries({@NamedQuery(name = "UccVwprofesormapa.findAll", query = "SELECT u FROM UccVwprofesormapa u"), @NamedQuery(name = "UccVwprofesormapa.findByIdprofesor", query = "SELECT u FROM UccVwprofesormapa u WHERE u.idprofesor = :idprofesor"), @NamedQuery(name = "UccVwprofesormapa.findByDocumento", query = "SELECT u FROM UccVwprofesormapa u WHERE u.documento = :documento"), @NamedQuery(name = "UccVwprofesormapa.findByNombres", query = "SELECT u FROM UccVwprofesormapa u WHERE lower(u.nombres) LIKE :nombres")})
public class UccVwprofesormapa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "IDPROFESOR")
    @Id
    private int idprofesor;
    @Basic(optional = false)
    @Column(name = "DOCUMENTO")
    private String documento;
    @Column(name = "NOMBRES")
    private String nombres;

    public UccVwprofesormapa() {
    }

    public int getIdprofesor() {
        return idprofesor;
    }

    public void setIdprofesor(int idprofesor) {
        this.idprofesor = idprofesor;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

}
