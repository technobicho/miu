/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.TipoZona;
import co.edu.ucentral.modelo.ZonaInfo;
import co.edu.ucentral.tools.LocalizarEnMapa;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zkex.zul.Borderlayout;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Panel;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Tree;
import org.zkoss.zul.Treecell;
import org.zkoss.zul.Treechildren;
import org.zkoss.zul.Treeitem;
import org.zkoss.zul.Treerow;

/**
 * Clase que construye un arbol con la informacion asociada a los elementos
 * tipo zona
 * @author David Acosta
 * @version 1.0
 */
public class ZonasArbol extends Tree implements EventListener {

    private static final long serialVersionUID = 6883168071314635908L;

    private EntityManagerFactory emf;
    private EntityManager em;
    private Treechildren tch = new Treechildren();
    private int idZona;

    /**
     * Metodo que inicializa y sobrecarga el objeto Tree
     */
    public void onCreate() {
        this.addEventListener("onSelect", this);
        emf = Persistence.createEntityManagerFactory("Miu2PU");
        consultaTipoZona();
    }

    /**
     * Metodo que captura los eventos del objeto Tree
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {

        if (arg0.getName().equals("onSelect")) {
            Tree myTree = (Tree) arg0.getTarget();
            Treeitem ti = (Treeitem) myTree.getSelectedItem();

            if (ti.getParentItem() != null) {
                Treerow tr = (Treerow) ti.getTreerow();
                Treecell tc = (Treecell) tr.getFirstChild();

                ZonaInfo zi = consultaZona(Integer.parseInt(tc.getId()));
                

                //Selecciona tab de buscar espacio
                Tab tb = (Tab) getFellow("tbMapa");
                tb.setSelected(true);

                //cierra el panel de piso
                Panel pp = (Panel) getFellow("pPisos");
                pp.setOpen(false);

                //abre el panel de dependencia
                Panel x = (Panel) getFellow("pDepen");
                x.setVisible(true);
                x.setOpen(true);                

                //Realiza la localizacion del edificio en el iframe
                LocalizarEnMapa lm = new LocalizarEnMapa();
                Iframe iframe = (Iframe) getFellow("ifMapa");
                iframe.setSrc(lm.localizaZona(zi));

                //abre informacion
                Borderlayout bly = (Borderlayout) getFellow("blPrincipal");
                bly.getEast().setOpen(false);
                
            }
        }
    }

    /**
     * Metodo que realiza la consulta de la zona y retorna la informacion de la misma
     * @param idZona identificador unico de la zona
     * @return objeto con la informacion de la zona
     */
    private ZonaInfo consultaZona(int idZona){
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("ZonaInfo.findByIdZona").setParameter("idZona", idZona);
        ZonaInfo zi = (ZonaInfo) q.getSingleResult();
        em.close();
        return zi;
    }

    /**
     * Consulta el tipo de zona
     */
    private void consultaTipoZona() {
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("TipoZona.findAll");
        List<TipoZona> tz = new ArrayList<TipoZona>();
        tz = q.getResultList();
        em.close();
        for(TipoZona i:tz){
            tch.appendChild(addTipoZona(i));
        }

        this.appendChild(tch);
    }

    /**
     * Metodo que agrega un tipo de zona al arbol principal y retorna un treeitem
     * con la informacion
     * @param tz
     * @return
     */
    private Treeitem addTipoZona(TipoZona tz) {
        List<String> l = new LinkedList<String>();
        l = new ArrayList<String>();
        l.add((String)tz.getNomTipoZona());

        Treeitem tim = new Treeitem();
        Treerow tro = new Treerow();
        Treecell tcl = null;
        for(int i = 0;i<l.size();i++){
            tcl = new Treecell();
            tcl.setLabel(l.get(i));
            tro.appendChild(tcl);
        }
        tro.appendChild(tcl);
        tim.appendChild(tro);

        Treechildren tchsub = consultaZonas(tz);
        List lch = tchsub.getChildren();
        if(lch.size() > 0){
            tim.appendChild(tchsub);
            tim.setOpen(false);
        }
        return tim;
    }

    /**
     * Metodo que consulta la informacion de la zona de acuerdo al tipo de zona
     * @param tipo
     * @return
     */
    private Treechildren consultaZonas(TipoZona tipo){

        boolean esPar = true;

        Treechildren tchd = new Treechildren();

        em = emf.createEntityManager();
        Query q = em.createNamedQuery("ZonaInfo.findByTipoZona")
                .setParameter("Tipo", tipo);
        List<ZonaInfo> zi = new ArrayList<ZonaInfo>();
        zi = q.getResultList();
        em.close();
        for(ZonaInfo i:zi){
            esPar = !esPar;
            tchd.appendChild(newChildZona(i.getIdZona(),i.getNomZona(),esPar));
        }

        return tchd;
    }

    /**
     * Metodo que retorna un treeitem de acuerdo al id y al nombre
     * @param idZona identificador unico de la zona
     * @param nomZona nombre comun de la zona
     * @param esPar variable que define si es par o impara para la representacion grafica
     * @return
     */
    private Treeitem newChildZona(int idZona, String nomZona, boolean esPar){
        Treeitem tim = new Treeitem();
        Treerow tro = new Treerow();
        Treecell tcl = new Treecell();
        if(esPar){
            tro.setStyle("background-color:#e6f8ff");
        }

        tcl.setLabel(nomZona);
        tcl.setId(idZona + "");
        tro.appendChild(tcl);
        tim.appendChild(tro);
        
        return tim;
    }
}



