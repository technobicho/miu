/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.EdificioPiso;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Tabbox;
import org.zkoss.zul.Tabpanel;
import org.zkoss.zul.Tabpanels;
import org.zkoss.zul.Tabs;

/**
 * Objeto que extiende de Tabbox y que permite visualizar la informacion
 * de los pisos asociados a un edificio
 * @author David Acosta
 * @version 1.0
 */
public class PisosTabs extends Tabbox  {

    private static final long serialVersionUID = -2826010220684302563L;
    private Tabs tabs = new Tabs();
    private Tabpanels tbp = new Tabpanels();
    private EntityManagerFactory emf;
    private EntityManager em;

    /**
     * Evento que inicializa y sobrecarga la creacion del objeto Tabbox
     */
    @Override
    public void onCreate() {
        emf = Persistence.createEntityManagerFactory("Miu2PU");
    }   

    /**
     * Metodo que agrega un nuevo piso
     * @param piso objeto piso
     * @return tab con la informacion del piso
     */
    private Tab addPisoEdificio(EdificioPiso piso) {
        Tab tab = new Tab(piso.getNomPiso());
        tab.setAttribute("idPiso", piso.getIdEdfPiso());
        tbp.appendChild(addEspacioPiso(piso));
        this.appendChild(tbp);
        return tab;
    }

    /**
     * Metodo que agrega los espacios asociados a un piso
     * @param piso objeto piso
     * @return retorna un tabpanel con la informacion de espacios
     */
    private Tabpanel addEspacioPiso(EdificioPiso piso) {
        Tabpanel tpl = new Tabpanel();
        EspaciosGrid eg = new EspaciosGrid(piso);
        tpl.appendChild(eg);
        return tpl;
    }

    /**
     * Metodo que limpia la lista de espacios
     */
    private void limpiaEspacios(){
        List<Tabpanel> list = tbp.getChildren();
        if(list.size() != 0){
            for(int i = list.size() - 1; i >= 0; i--){
                tbp.removeChild((Tabpanel) list.get(i));
            }
        }
    }

    /**
     * Metodo que realiza la consulta de cada piso
     * @param idEdificio identificador del edificio
     * @return si es true encontro pisos, false el edificio no tiene pisos
     * @throws InterruptedException
     */
    public void consultaPisos(EdificioInfo idEdificio) {
        em = emf.createEntityManager();

        //Limpia de tabs previos
        List<Tab> li = tabs.getChildren();
        if (li.size() != 0) {
            for (int i = li.size() - 1; i >= 0; i--) {
                tabs.removeChild((Tab) li.get(i));
            }
        }
        
        limpiaEspacios();

        List<EdificioPiso> listEdfPiso = new ArrayList<EdificioPiso>();
        listEdfPiso = em.createNamedQuery("EdificioPiso.findByIdEdificio")
                .setParameter("idEdificio", idEdificio)
                .getResultList();
        em.close();
        if(!listEdfPiso.isEmpty()){
            for(EdificioPiso ep: listEdfPiso){
                tabs.appendChild(addPisoEdificio(ep));
            }
            this.appendChild(tabs);
        }
    }
}
