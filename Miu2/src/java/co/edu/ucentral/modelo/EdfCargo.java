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
 * Clase que define la persistencia del objeto EdfCargo
 * @author David Acosta
 * @version 1.0
 */
@Entity
@Table(name = "edf_cargo")
@NamedQueries({@NamedQuery(name = "EdfCargo.findAll", query = "SELECT e FROM EdfCargo e"), @NamedQuery(name = "EdfCargo.findByNomCargo", query = "SELECT e FROM EdfCargo e WHERE e.nomCargo = :nomCargo"), @NamedQuery(name = "EdfCargo.findByNomFuncionario", query = "SELECT e FROM EdfCargo e WHERE e.nomFuncionario = :nomFuncionario"), @NamedQuery(name = "EdfCargo.findByNomTipocargo", query = "SELECT e FROM EdfCargo e WHERE e.nomTipocargo = :nomTipocargo"), @NamedQuery(name = "EdfCargo.findByIdFuncionario", query = "SELECT e FROM EdfCargo e WHERE e.idFuncionario = :idFuncionario"), @NamedQuery(name = "EdfCargo.findByIdCargo", query = "SELECT e FROM EdfCargo e WHERE e.idCargo = :idCargo"), @NamedQuery(name = "EdfCargo.findByIdTipocargo", query = "SELECT e FROM EdfCargo e WHERE e.idTipocargo = :idTipocargo"), @NamedQuery(name = "EdfCargo.findByIdEdfEspacio", query = "SELECT e FROM EdfCargo e WHERE e.idEdfEspacio = :idEdfEspacio"), @NamedQuery(name = "EdfCargo.findByNomEspacio", query = "SELECT e FROM EdfCargo e WHERE e.nomEspacio = :nomEspacio"), @NamedQuery(name = "EdfCargo.findByIdEdfPiso", query = "SELECT e FROM EdfCargo e WHERE e.idEdfPiso = :idEdfPiso"), @NamedQuery(name = "EdfCargo.findByNomPiso", query = "SELECT e FROM EdfCargo e WHERE e.nomPiso = :nomPiso"), @NamedQuery(name = "EdfCargo.findByIdEdificio", query = "SELECT e FROM EdfCargo e WHERE e.idEdificio = :idEdificio"), @NamedQuery(name = "EdfCargo.findByNomEdificio", query = "SELECT e FROM EdfCargo e WHERE e.nomEdificio = :nomEdificio"), @NamedQuery(name = "EdfCargo.findByIdTipoEspacio", query = "SELECT e FROM EdfCargo e WHERE e.idTipoEspacio = :idTipoEspacio"), @NamedQuery(name = "EdfCargo.findByNomTipoEspacio", query = "SELECT e FROM EdfCargo e WHERE e.nomTipoEspacio = :nomTipoEspacio"), @NamedQuery(name = "EdfCargo.findByIdSede", query = "SELECT e FROM EdfCargo e WHERE e.idSede = :idSede"), @NamedQuery(name = "EdfCargo.findByNomSede", query = "SELECT e FROM EdfCargo e WHERE e.nomSede = :nomSede")})
public class EdfCargo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "nom_cargo")
    private String nomCargo;
    @Column(name = "nom_funcionario")
    private String nomFuncionario;
    @Column(name = "nom_tipocargo")
    private String nomTipocargo;
    @Column(name = "id_funcionario")
    @Id
    private Integer idFuncionario;
    @Column(name = "id_cargo")
    private Integer idCargo;
    @Column(name = "id_tipocargo")
    private Integer idTipocargo;
    @Column(name = "id_edf_espacio")
    private Integer idEdfEspacio;
    @Column(name = "nom_espacio")
    private String nomEspacio;
    @Column(name = "id_edf_piso")
    private Integer idEdfPiso;
    @Column(name = "nom_piso")
    private String nomPiso;
    @Column(name = "id_edificio")
    private Integer idEdificio;
    @Column(name = "nom_edificio")
    private String nomEdificio;
    @Column(name = "id_tipo_espacio")
    private Integer idTipoEspacio;
    @Column(name = "nom_tipo_espacio")
    private String nomTipoEspacio;
    @Column(name = "id_sede")
    private Integer idSede;
    @Column(name = "nom_sede")
    private String nomSede;

    public EdfCargo() {
    }

    public String getNomCargo() {
        return nomCargo;
    }

    public void setNomCargo(String nomCargo) {
        this.nomCargo = nomCargo;
    }

    public String getNomFuncionario() {
        return nomFuncionario;
    }

    public void setNomFuncionario(String nomFuncionario) {
        this.nomFuncionario = nomFuncionario;
    }

    public String getNomTipocargo() {
        return nomTipocargo;
    }

    public void setNomTipocargo(String nomTipocargo) {
        this.nomTipocargo = nomTipocargo;
    }

    public Integer getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(Integer idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public Integer getIdTipocargo() {
        return idTipocargo;
    }

    public void setIdTipocargo(Integer idTipocargo) {
        this.idTipocargo = idTipocargo;
    }

    public Integer getIdEdfEspacio() {
        return idEdfEspacio;
    }

    public void setIdEdfEspacio(Integer idEdfEspacio) {
        this.idEdfEspacio = idEdfEspacio;
    }

    public String getNomEspacio() {
        return nomEspacio;
    }

    public void setNomEspacio(String nomEspacio) {
        this.nomEspacio = nomEspacio;
    }

    public Integer getIdEdfPiso() {
        return idEdfPiso;
    }

    public void setIdEdfPiso(Integer idEdfPiso) {
        this.idEdfPiso = idEdfPiso;
    }

    public String getNomPiso() {
        return nomPiso;
    }

    public void setNomPiso(String nomPiso) {
        this.nomPiso = nomPiso;
    }

    public Integer getIdEdificio() {
        return idEdificio;
    }

    public void setIdEdificio(Integer idEdificio) {
        this.idEdificio = idEdificio;
    }

    public String getNomEdificio() {
        return nomEdificio;
    }

    public void setNomEdificio(String nomEdificio) {
        this.nomEdificio = nomEdificio;
    }

    public Integer getIdTipoEspacio() {
        return idTipoEspacio;
    }

    public void setIdTipoEspacio(Integer idTipoEspacio) {
        this.idTipoEspacio = idTipoEspacio;
    }

    public String getNomTipoEspacio() {
        return nomTipoEspacio;
    }

    public void setNomTipoEspacio(String nomTipoEspacio) {
        this.nomTipoEspacio = nomTipoEspacio;
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

}
