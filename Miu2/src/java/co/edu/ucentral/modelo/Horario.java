/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;


import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Clase que define el objeto horario
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "horario")
@NamedQueries({@NamedQuery(name = "Horario.findAll", query = "SELECT h FROM Horario h"), @NamedQuery(name = "Horario.findByIdDocente", query = "SELECT h FROM Horario h WHERE h.horarioPK.idDocente = :idDocente"), @NamedQuery(name = "Horario.findByIdMateria", query = "SELECT h FROM Horario h WHERE h.horarioPK.idMateria = :idMateria"), @NamedQuery(name = "Horario.findByIdEdificio", query = "SELECT h FROM Horario h WHERE h.idEdificio = :idEdificio"), @NamedQuery(name = "Horario.findByNomAula", query = "SELECT h FROM Horario h WHERE h.nomAula = :nomAula"), @NamedQuery(name = "Horario.findByDiaSemana", query = "SELECT h FROM Horario h WHERE h.diaSemana = :diaSemana"), @NamedQuery(name = "Horario.findByHora", query = "SELECT h FROM Horario h WHERE h.hora = :hora"), @NamedQuery(name = "Horario.findByDuracion", query = "SELECT h FROM Horario h WHERE h.duracion = :duracion"), @NamedQuery(name = "Horario.findByIdHorario", query = "SELECT h FROM Horario h WHERE h.horarioPK.idHorario = :idHorario")})
public class Horario implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected HorarioPK horarioPK;
    @Basic(optional = false)
    @Column(name = "id_edificio")
    private int idEdificio;
    @Basic(optional = false)
    @Column(name = "nom_aula")
    private String nomAula;
    @Column(name = "dia_semana")
    private Integer diaSemana;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Column(name = "duracion")
    private Integer duracion;
    @JoinColumn(name = "id_docente", referencedColumnName = "id_docente", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Docentes docentes;
    @JoinColumn(name = "id_materia", referencedColumnName = "id_materia", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Materias materias;

    public Horario() {
    }

    public Horario(HorarioPK horarioPK) {
        this.horarioPK = horarioPK;
    }

    public Horario(HorarioPK horarioPK, int idEdificio, String nomAula) {
        this.horarioPK = horarioPK;
        this.idEdificio = idEdificio;
        this.nomAula = nomAula;
    }

    public Horario(int idDocente, int idMateria, int idHorario) {
        this.horarioPK = new HorarioPK(idDocente, idMateria, idHorario);
    }

    public HorarioPK getHorarioPK() {
        return horarioPK;
    }

    public void setHorarioPK(HorarioPK horarioPK) {
        this.horarioPK = horarioPK;
    }

    public int getIdEdificio() {
        return idEdificio;
    }

    public void setIdEdificio(int idEdificio) {
        this.idEdificio = idEdificio;
    }

    public String getNomAula() {
        return nomAula;
    }

    public void setNomAula(String nomAula) {
        this.nomAula = nomAula;
    }

    public Integer getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(Integer diaSemana) {
        this.diaSemana = diaSemana;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public Docentes getDocentes() {
        return docentes;
    }

    public void setDocentes(Docentes docentes) {
        this.docentes = docentes;
    }

    public Materias getMaterias() {
        return materias;
    }

    public void setMaterias(Materias materias) {
        this.materias = materias;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (horarioPK != null ? horarioPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Horario)) {
            return false;
        }
        Horario other = (Horario) object;
        if ((this.horarioPK == null && other.horarioPK != null) || (this.horarioPK != null && !this.horarioPK.equals(other.horarioPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.ucentral.modelo.Horario[horarioPK=" + horarioPK + "]";
    }

}
