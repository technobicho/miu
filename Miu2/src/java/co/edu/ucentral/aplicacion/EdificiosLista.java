package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.SedeInfo;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Listbox;

import co.edu.ucentral.tools.LocalizarEnMapa;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.zkoss.zkex.zul.Borderlayout;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Panel;
import org.zkoss.zul.Tab;

/**
 * Clase que crea una lista de los edificios
 * @author David Acosta
 * @version 1.0
 */
public class EdificiosLista extends Listbox implements EventListener {

    private static final long serialVersionUID = 6095640962015904371L;
    private EntityManagerFactory emf;
    private EntityManager em;
    private List<EdificioInfo> edificios;

    /**
     * Metodo que inicializa y sobrecarga el objeto Listbox
     */
    public void onCreate() {
        this.addEventListener("onSelect", this);
        this.setVflex(true);
        this.setRows(17);
        edificios = new ArrayList<EdificioInfo>();
        emf = Persistence.createEntityManagerFactory("Miu2PU");
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("EdificioInfo.findAll");
        edificios = q.getResultList();
        em.close();
        creaLista();
    }

    /**
     * Metodo que captura todos los eventos sobre el objeto Listbox
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {
        //Captura el metodo select sobre el objeto listitem
        if (arg0.getName().equals("onSelect")) {
            Listbox lb = (Listbox) arg0.getTarget();
            Listitem li = lb.getSelectedItem();
            int idEdf = Integer.parseInt(li.getValue() + "");
            em = emf.createEntityManager();
            EdificioInfo edfinf = (EdificioInfo) em.createNamedQuery("EdificioInfo.findByIdEdificio").setParameter("idEdificio", idEdf).getSingleResult();
            em.close();

            //Selecciona tab de buscar espacio
            Tab tb = (Tab) getFellow("tbMapa");
            tb.setSelected(true);

            //cierra panel de Dependencias
            Panel pd = (Panel) getFellow("pDepen");
            pd.setOpen(false);
            pd.setVisible(false);

            //abre panel de Pisos
            Panel pp = (Panel) getFellow("pPisos");
            pp.setOpen(true);

            //Define el contenido de descripcion y pisos para el edificio seleccionado
            Panel pi = (Panel) getFellow("pFoto");
            Image img = (Image) getFellow("imgEdf");
            if (edfinf.getPicture() != null) {
                byte[] bytearray = edfinf.getPicture();
                InputStream in = new ByteArrayInputStream(bytearray);
                BufferedImage imag = ImageIO.read(in);
                if (imag != null) {
                    img.setContent(imag);
                    pi.setVisible(true);
                    pi.setOpen(true);
                }
            } else {
                pi.setVisible(false);
                pi.setOpen(false);
            }

            Label lblDesc = (Label) getFellow("lblDescripcion");
            lblDesc.setValue(edfinf.getDescripcion());

            PisosTabs pt = (PisosTabs) getFellow("tbPisos");
            pt.consultaPisos(edfinf);

            //Realiza la localizacion del edificio en el iframe
            LocalizarEnMapa lm = new LocalizarEnMapa();
            Iframe iframe = (Iframe) getFellow("ifMapa");
            iframe.setSrc(lm.localizaEdificio(edfinf));

            //abre informacion
            Borderlayout bly = (Borderlayout) getFellow("blPrincipal");
            bly.getEast().setOpen(true);
            bly.getEast().setTitle(edfinf.getNomEdificio());
        }

    }

    /**
     * Crea una lista con la informacion de edificios
     */
    private void creaLista() {
        for (EdificioInfo l : edificios) {
            this.appendItem(l.getNomEdificio(), l.getIdEdificio().toString());
        }
    }

    /**
     * consulta la informacion de los edificios de acuerdo al identificador
     * de la sede
     * @param sede objeto sede
     */
    public void consultaEdificios(SedeInfo sede) {
        this.getItems().clear();
        em = emf.createEntityManager();
        edificios = em.createNamedQuery("EdificioInfo.findBySede").setParameter("sede", sede).getResultList();
        creaLista();
        em.close();
    }
}
