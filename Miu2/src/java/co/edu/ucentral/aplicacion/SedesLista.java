/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.SedeInfo;
import co.edu.ucentral.tools.LocalizarEnMapa;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Panel;

/**
 * Clase que crea una lista de las sedes de la universidad
 * @author David Acosta
 */
public class SedesLista extends Listbox implements EventListener {

    private static final long serialVersionUID = -6749524688498208877L;

    private List<SedeInfo> sedes = new ArrayList<SedeInfo>();
    EntityManagerFactory emf;
    EntityManager em;

    /**
     * Metodo que inicializa y sobre carga la creacion del objeto Listbox
     */
    public void onCreate() {
        this.addEventListener("onSelect", this);
        this.setVflex(true);
        emf = Persistence.createEntityManagerFactory("Miu2PU");
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("SedeInfo.findAll");
        sedes = q.getResultList();
        em.close();
        creaLista();
    }

    /**
     * Metodo que captura los eventos asociados al objeto
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {
        //carga la lista referente a la sede seleccionada
        if (arg0.getName().equals("onSelect")) {
            Listbox lb = (Listbox) arg0.getTarget();
            Listitem li = lb.getSelectedItem();
            int idSd = Integer.parseInt(li.getValue() + "");
            EdificiosLista edflist = (EdificiosLista) getFellow("lbxEdificios");
            em = emf.createEntityManager();
            SedeInfo sd = (SedeInfo) em.createNamedQuery("SedeInfo.findByIdSede")
                    .setParameter("idSede", idSd).getSingleResult();
            em.close();
            edflist.consultaEdificios(sd);

            //abre el panel de edificios
            Panel pp = (Panel) getFellow("pEdificios");
            pp.setOpen(true);

            //cierra otros paneles
            Panel pd1 = (Panel)getFellow("pDependencias");
            pd1.setOpen(false);
            Panel pz =(Panel)getFellow("pZonas");
            pz.setOpen(false);

            //Realiza la localizacion del edificio en el iframe
            LocalizarEnMapa lm = new LocalizarEnMapa();            
            Iframe iframe = (Iframe) getFellow("ifMapa");
            iframe.setSrc(lm.localizaSede(sd));

            
        }
    }


    /**
     * Metodo que crea la lista de las sedes
     */
    private void creaLista() {
        for (SedeInfo l : sedes) {
            this.appendItem(l.getNomSede(), l.getIdSede().toString());
        }
    }

    /**
     * Metodo que obtiene una lista con la informacion de las sedes.
     * @return
     */
    public List<SedeInfo> getSedes() {
        return sedes;
    }
}
