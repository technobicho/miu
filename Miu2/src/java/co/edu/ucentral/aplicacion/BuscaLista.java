/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.Espacios;
import co.edu.ucentral.modelo.Listnom;
import co.edu.ucentral.tools.LocalizarEnMapa;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zkex.zul.Borderlayout;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listhead;
import org.zkoss.zul.Listheader;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Panel;
import org.zkoss.zul.Tab;

/**
 * Clase que realiza la busqueda general sobre la base de datos
 * creando un listbox con los resultados de la aplicacion
 * @author David Acosta
 * @version 1.0
 */
public class BuscaLista extends Listbox implements EventListener {

    private static final long serialVersionUID = -504639068023913921L;
    private EntityManagerFactory emf;
    private EntityManager em;

    /**
     * Metodo que inicializa y sobrecarga el objeto listbox
     */
    public void onCreate() {
        this.addEventListener("onSelect", this);
        emf = Persistence.createEntityManagerFactory("Miu2PU");

        this.setVflex(true);
        this.setRows(20);
        Listhead lh = new Listhead();
        lh.setSizable(true);
        Listheader lhrEsp = new Listheader("Edificio");
        lhrEsp.setSort("true");
        Listheader lhrEdf = new Listheader("Espacio");
        lhrEdf.setSort("true");
        Listheader lhrPs = new Listheader("Piso");
        lhrPs.setSort("true");
        Listheader lhrSd = new Listheader("Sede");
        lhrSd.setSort("true");
        lh.appendChild(lhrEsp);
        lh.appendChild(lhrEdf);
        lh.appendChild(lhrPs);
        lh.appendChild(lhrSd);
        this.appendChild(lh);
    }

    /**
     * Metod que administra los eventos sobre los listitem
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {
        if (arg0.getName().equals("onSelect")) {
            Listbox lb = (Listbox) arg0.getTarget();
            Listitem li = lb.getSelectedItem();
            int idEdf = Integer.parseInt(li.getValue() + "");
            em = emf.createEntityManager();
            EdificioInfo edfinf = (EdificioInfo) em.createNamedQuery("EdificioInfo.findByIdEdificio")
                    .setParameter("idEdificio", idEdf).getSingleResult();
            em.close();

            //Selecciona tab de buscar espacio
            Tab tb = (Tab) getFellow("tbMapa");
            tb.setSelected(true);

            //cierra paneles izquierdos
            Panel pe = (Panel)getFellow("pEdificios");
            pe.setOpen(false);
            Panel pd1 = (Panel)getFellow("pDependencias");
            pd1.setOpen(false);
            Panel pz =(Panel)getFellow("pZonas");
            pz.setOpen(false);


            //cierra panel de Dependencias
            Panel pd = (Panel) getFellow("pDepen");
            pd.setOpen(false);
            pd.setVisible(false);

            //abre panel de Pisos
            Panel pp = (Panel) getFellow("pPisos");
            pp.setOpen(true);

            //Define el contenido de descripcion y pisos para el edificio
            //seleccionado
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
     * Realiza la consulta sobre la vista Listnom, en la cual se clasifican
     * por tipo los edificios, pisos y espacios
     * @param consulta minimo 3 caracteres para realizar la consulta
     */
    public void consultaEspacios(String consulta) {
        em = emf.createEntityManager();
        List<Listnom> list = new ArrayList<Listnom>();
        list = em.createNamedQuery("Listnom.findByNombre")
                .setParameter("nombre", "%" + consulta.toLowerCase() + "%")
                .getResultList();
        em.close();
        try {
            if (list.isEmpty()) {
                Messagebox.show("No se encuentran resultados",
                        "Información", Messagebox.OK, Messagebox.INFORMATION);
            } else {
                this.getItems().clear();
                for (Listnom lstnom : list) {
                    clasificaTipo(lstnom);
                }
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(BuscaLista.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Realiza la clasificacion por tipo Edificio, Piso o Espacio
     * @param lstnombre lista de nombres
     */
    private void clasificaTipo(Listnom lstnombre) {
        List<Espacios> lstEsp = new ArrayList<Espacios>();
        em = emf.createEntityManager();
        switch (lstnombre.getTipo()) {
            case 0:
                lstEsp = em.createNamedQuery("Espacios.findByIdEdificio")
                        .setParameter("idEdificio", lstnombre.getIde())
                        .getResultList();
                break;
            case 1:
                lstEsp = em.createNamedQuery("Espacios.findByIdEdfEspacio")
                        .setParameter("idEdfEspacio", lstnombre.getIde())
                        .getResultList();
                break;
            case 2:
                lstEsp = em.createNamedQuery("Espacios.findByIdEdfPiso")
                        .setParameter("idEdfPiso", lstnombre.getIde())
                        .getResultList();
                break;
            default:
                break;
        }
        em.close();
        creaLista(lstEsp);
    }

    /**
     * Crea el componente Listitem de acuerdo a la lista de espacios que recibe
     * @param lstEspacios lista de espacios
     */
    private void creaLista(List<Espacios> lstEspacios) {
        for (Espacios list : lstEspacios) {
            Listitem li = new Listitem();
            li.setValue(list.getId().getIdEdificio());
            li.appendChild(new Listcell(list.getNomEdificio()));
            li.appendChild(new Listcell(list.getNomEspacio()));
            li.appendChild(new Listcell(list.getNomPiso()));
            li.appendChild(new Listcell(list.getNomSede()));
            this.appendChild(li);
        }
    }
}
