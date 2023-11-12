/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Clase que define la llave primaria para la vista espacios
 * @author David Acosta
 * @version 1.0
 */
@Embeddable
public class EspaciosPK implements Serializable{
    private static final long serialVersionUID = -4962684630062272072L;
    @Column(name="id_edificio")
    private int idEdificio;
    @Column(name="id_edf_piso")
    private int idEdfPiso;
    @Column(name="id_edf_espacio")
    private int idEdfEspacio;

    public EspaciosPK() {
    }

    public EspaciosPK(int idEdificio, int idEdfPiso, int idEdfEspacio) {
        this.idEdificio = idEdificio;
        this.idEdfPiso = idEdfPiso;
        this.idEdfEspacio = idEdfEspacio;
    }

    /**
     * @return the idEdificio
     */
    public int getIdEdificio() {
        return idEdificio;
    }

    /**
     * @param idEdificio the idEdificio to set
     */
    public void setIdEdificio(int idEdificio) {
        this.idEdificio = idEdificio;
    }

    /**
     * @return the idEdfPiso
     */
    public int getIdEdfPiso() {
        return idEdfPiso;
    }

    /**
     * @param idEdfPiso the idEdfPiso to set
     */
    public void setIdEdfPiso(int idEdfPiso) {
        this.idEdfPiso = idEdfPiso;
    }

    /**
     * @return the idEdfEspacio
     */
    public int getIdEdfEspacio() {
        return idEdfEspacio;
    }

    /**
     * @param idEdfEspacio the idEdfEspacio to set
     */
    public void setIdEdfEspacio(int idEdfEspacio) {
        this.idEdfEspacio = idEdfEspacio;
    }
    
}
