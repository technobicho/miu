/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdificioEspacio;
import co.edu.ucentral.modelo.EdificioPiso;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Button;
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.Rows;

/**
 *Consulta y construye un grid con los espacios asociados a un piso
 * perticular definido por el id del piso
 * @author David Acosta
 */
public class EspaciosGrid extends Grid implements EventListener {

    private static final long serialVersionUID = 8886455236871142317L;
    private EdificioPiso piso;
    private Rows rows = new Rows();
    private Button btn = new Button();
    private String plano = "";
    private EntityManagerFactory emf;
    private EntityManager em;

    /**
     * constructor de la clase
     * @param idPiso identificador del piso
     */
    public EspaciosGrid(EdificioPiso piso) {
        this.piso = piso;
        emf = Persistence.createEntityManagerFactory("Miu2PU");
        consultaEspacios();
    }

    /**
     * Metodo que realiza la consulta de los espacios asociados a un piso
     */
    private void consultaEspacios() {
        boolean flag = false;
        em = emf.createEntityManager();
        List<EdificioEspacio> ledfPiso = new ArrayList<EdificioEspacio>();
        String psql = "SELECT ee " +
                "FROM EdificioPiso ep JOIN ep.edificioEspacioCollection ee " +
                "WHERE ee.idPiso = ?1 ORDER BY ee.nomEspacio";
        ledfPiso = em.createQuery(psql).setParameter(1, piso)
                .getResultList();
        em.close();

        for(EdificioEspacio e: ledfPiso){
            rows.appendChild(newItem(e.getNomEspacio(),e.getIdEdfEspacio()));
            flag = true;
        }

        rows.appendChild(addLinkPlan());

        if (flag) {
            this.appendChild(rows);
        }
    }

    /**
     * Metodo que construye la fila con la informacion del piso
     * @param nombre Nombre del espacio
     * @param id identificador del espacio
     * @return fila con la informacion del espacio asociado.
     */
    private Row newItem(String nombre, int id) {
        Row row = new Row();
        Label lbl = new Label();
        lbl.setValue(nombre);
        lbl.setAttribute("idEspacio", id);
        row.appendChild(lbl);
        return row;
    }

    /**
     * Agrega un boton para descargar el plano del piso
     * @return
     */
    private Row addLinkPlan() {
        Row row = new Row();
        btn.setLabel("Descargar Plano");
        plano = piso.getPlano();
        if (plano == null) {
            btn.setDisabled(true);
        } else {
            btn.addEventListener("onClick", this);
            row.appendChild(btn);
        }
        return row;
    }

    /**
     * Administra los eventos del objeto
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {
        //filtra el evento click sobre los botones
        if (arg0.getName().equals("onClick")) {
            Filedownload.save(plano, null);
        }
    }
}
