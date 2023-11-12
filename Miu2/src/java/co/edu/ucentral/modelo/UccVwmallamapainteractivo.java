/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Clase que define la persistencia para la vista proporcionada por universitas
 * para la informacion de docentes y horarios
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "ucc_vwmallamapainteractivo")
@NamedQueries({@NamedQuery(name="UccVwmallamapainteractivo.horarioByProfesorAndPeriodo", query="SELECT u FROM UccVwmallamapainteractivo u WHERE u.documentoprofesor = :documento AND u.periodo = :periodo"), @NamedQuery(name = "UccVwmallamapainteractivo.profesorByMateria",query = "SELECT u.documentoprofesor FROM UccVwmallamapainteractivo u WHERE u.codigoasignatura = :codigoasignatura AND u.periodo = :periodo GROUP BY u.documentoprofesor"),@NamedQuery(name = "UccVwmallamapainteractivo.findAll", query = "SELECT u FROM UccVwmallamapainteractivo u"), @NamedQuery(name = "UccVwmallamapainteractivo.findByIdedificio", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.idedificio = :idedificio"), @NamedQuery(name = "UccVwmallamapainteractivo.findByEdificio", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.edificio = :edificio"), @NamedQuery(name = "UccVwmallamapainteractivo.findByIdprofesor", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.idprofesor = :idprofesor"), @NamedQuery(name = "UccVwmallamapainteractivo.findByDocumentoprofesor", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.documentoprofesor = :documentoprofesor"), @NamedQuery(name = "UccVwmallamapainteractivo.findByNombres", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.nombres = :nombres"), @NamedQuery(name = "UccVwmallamapainteractivo.findByApellido1", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.apellido1 = :apellido1"), @NamedQuery(name = "UccVwmallamapainteractivo.findByApellido2", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.apellido2 = :apellido2"), @NamedQuery(name = "UccVwmallamapainteractivo.findByDiasemana", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.diasemana = :diasemana"), @NamedQuery(name = "UccVwmallamapainteractivo.findByHora", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.hora = :hora"), @NamedQuery(name = "UccVwmallamapainteractivo.findByDuracion", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.duracion = :duracion"), @NamedQuery(name = "UccVwmallamapainteractivo.findByCodigoasignatura", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.codigoasignatura = :codigoasignatura"), @NamedQuery(name = "UccVwmallamapainteractivo.findByNombreasignatura", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.nombreasignatura = :nombreasignatura"), @NamedQuery(name = "UccVwmallamapainteractivo.findByAula", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.aula = :aula"), @NamedQuery(name = "UccVwmallamapainteractivo.findBySede", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.sede = :sede"), @NamedQuery(name = "UccVwmallamapainteractivo.findByPeriodo", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.periodo = :periodo"), @NamedQuery(name = "UccVwmallamapainteractivo.findByFechainicio", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.fechainicio = :fechainicio"), @NamedQuery(name = "UccVwmallamapainteractivo.findByFechafin", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.fechafin = :fechafin"), @NamedQuery(name = "UccVwmallamapainteractivo.findByDescripciongrupo", query = "SELECT u FROM UccVwmallamapainteractivo u WHERE u.descripciongrupo = :descripciongrupo")})
public class UccVwmallamapainteractivo implements Serializable {
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private UccVwmapaPK uccvwmapaPK;
    @Column(name = "idedificio")
    private String idedificio;
    @Column(name = "edificio")
    private String edificio;
    @Column(name = "idprofesor")
    private Integer idprofesor;
    @Column(name = "documentoprofesor")
    private String documentoprofesor;
    @Column(name = "nombres")
    private String nombres;
    @Column(name = "apellido1")
    private String apellido1;
    @Column(name = "apellido2")
    private String apellido2;
    @Column(name = "diasemana")
    private String diasemana;
    @Column(name = "hora")
    private String hora;
    @Column(name = "duracion")
    private BigInteger duracion;
    @Column(name = "codigoasignatura")
    private String codigoasignatura;
    @Column(name = "nombreasignatura")
    private String nombreasignatura;
    @Column(name = "aula")
    private String aula;
    @Column(name = "sede")
    private String sede;
    @Column(name = "periodo")
    private String periodo;
    @Column(name = "fechainicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechainicio;
    @Column(name = "fechafin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechafin;
    @Column(name = "descripciongrupo")
    private String descripciongrupo;


    

    public UccVwmallamapainteractivo() {
    }

    public UccVwmallamapainteractivo(UccVwmapaPK id){
        this.uccvwmapaPK = id;
    }

    public UccVwmallamapainteractivo(UccVwmapaPK id, int idprofesor, String diasemana, String hora, String codigoasignatura){
        this.uccvwmapaPK = id;
        this.idprofesor = idprofesor;
        this.diasemana = diasemana;
        this.hora = hora;
        this.codigoasignatura = codigoasignatura;
    }

    public UccVwmallamapainteractivo(int idprofesor, String diasemana, String hora, String codigoasignatura){
        this.uccvwmapaPK = new UccVwmapaPK(idprofesor, diasemana, hora, codigoasignatura);
    }

    public String getIdedificio() {
        return idedificio;
    }

    public void setIdedificio(String idedificio) {
        this.idedificio = idedificio;
    }

    public String getEdificio() {
        return edificio;
    }

    public void setEdificio(String edificio) {
        this.edificio = edificio;
    }

    public Integer getIdprofesor() {
        return idprofesor;
    }

    public void setIdprofesor(Integer idprofesor) {
        this.idprofesor = idprofesor;
    }

    public String getDocumentoprofesor() {
        return documentoprofesor;
    }

    public void setDocumentoprofesor(String documentoprofesor) {
        this.documentoprofesor = documentoprofesor;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getDiasemana() {
        return diasemana;
    }

    public void setDiasemana(String diasemana) {
        this.diasemana = diasemana;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public BigInteger getDuracion() {
        return duracion;
    }

    public void setDuracion(BigInteger duracion) {
        this.duracion = duracion;
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

    public String getAula() {
        return aula;
    }

    public void setAula(String aula) {
        this.aula = aula;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public Date getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafin() {
        return fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public String getDescripciongrupo() {
        return descripciongrupo;
    }

    public void setDescripciongrupo(String descripciongrupo) {
        this.descripciongrupo = descripciongrupo;
    }

    /**
     * @return the uccvwmapaPK
     */
    public UccVwmapaPK getId() {
        return uccvwmapaPK;
    }

    /**
     * @param uccvwmapaPK the uccvwmapaPK to set
     */
    public void setId(UccVwmapaPK id) {
        this.uccvwmapaPK = id;
    }

   

}
