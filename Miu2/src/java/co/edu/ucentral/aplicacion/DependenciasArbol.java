/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdfCargo;
import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.TipoCargo;


import co.edu.ucentral.tools.LocalizarEnMapa;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zkex.zul.Borderlayout;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Panel;
import org.zkoss.zul.Row;
import org.zkoss.zul.Rows;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Tree;
import org.zkoss.zul.Treecell;
import org.zkoss.zul.Treechildren;
import org.zkoss.zul.Treeitem;
import org.zkoss.zul.Treerow;

/**
 * Arbol que administra la informacion de grupo de dependencias y
 * agrupados por funcionarios que pertenencen a cada dependencia
 * @author David Acosta
 * @version 1.0
 */
public class DependenciasArbol extends Tree implements EventListener {

    private static final long serialVersionUID = -6642933010205733019L;
    private Treechildren tch = new Treechildren();
    private EntityManagerFactory emf;
    private EntityManager em;
    private int idEdf;

    /**
     * Metodo que inicializa y sobrecarga el objeto Tree
     */
    public void onCreate() {
        this.addEventListener("onSelect", this);
        emf = Persistence.createEntityManagerFactory("Miu2PU");
        consultaDependencias();
    }

    /**
     * Metodo que administra los eventos del objeto Tree
     * @param arg0
     * @throws Exception
     */
    @Override
    public void onEvent(Event arg0) throws Exception {
        //Captura todos los eventos de tipo seleccion
        if (arg0.getName().equals("onSelect")) {
            Tree myTree = (Tree) arg0.getTarget();
            Treeitem ti = (Treeitem) myTree.getSelectedItem();

            //Evalua si el item es un hijo y no el padre principal
            if (ti.getParentItem() != null) {
                Treerow tr = (Treerow) ti.getTreerow();
                Treecell tc = (Treecell) tr.getFirstChild();

                consultaDatosFuncionarios(Integer.parseInt(tc.getId()));
                em = emf.createEntityManager();
                EdificioInfo edfinf = (EdificioInfo) em.createNamedQuery("EdificioInfo.findByIdEdificio").setParameter("idEdificio", idEdf).getSingleResult();
                em.close();

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


                //Define el contenido de descripcion y pisos para el edificio seleccionado
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
    }

    /**
     * Realiza la consulta de funcionarios, de acuerdo al id del cargo
     * @param idCargo identificador unico del cargo
     */
    private void consultaDatosFuncionarios(int idCargo) {
        em = emf.createEntityManager();
        EdfCargo edfcg = (EdfCargo) em.createNamedQuery("EdfCargo.findByIdCargo").setParameter("idCargo", idCargo).getSingleResult();
        em.close();
        idEdf = edfcg.getIdEdificio();

        //Define el contenido de la dependencia
        Panel pnlInfo = (Panel) getFellow("pDepen");
        pnlInfo.setTitle("Dependencia");

        //crea la estructura del Grid
        createGridInfo();
       
        Row rwCargo = (Row)getFellow("r0");
        Label lblCargo = new Label("Cargo: ");
        lblCargo.setStyle("font-weight:bold");
        rwCargo.appendChild(lblCargo);
        rwCargo.appendChild(new Label(edfcg.getNomCargo()));

        Row rwNombre = (Row)getFellow("r1");
        Label lblNombre = new Label("Nombre: ");
        lblNombre.setStyle("font-weight:bold");
        rwNombre.appendChild(lblNombre);
        rwNombre.appendChild(new Label(edfcg.getNomFuncionario()));

        Row rwSede = (Row)getFellow("r2");
        Label lblSede = new Label("Sede: ");
        lblSede.setStyle("font-weight:bold");
        rwSede.appendChild(lblSede);
        rwSede.appendChild(new Label(edfcg.getNomSede()));

        Row rwEdf = (Row)getFellow("r3");
        Label lblEdf = new Label("Edificio: ");
        lblEdf.setStyle("font-weight:bold");
        rwEdf.appendChild(lblEdf);
        rwEdf.appendChild(new Label(edfcg.getNomEdificio()));

        Row rwPiso = (Row)getFellow("r4");
        Label lblPiso = new Label("Piso: ");
        lblPiso.setStyle("font-weight:bold");
        rwPiso.appendChild(lblPiso);
        rwPiso.appendChild(new Label(edfcg.getNomPiso()));

        Row rwDep = (Row)getFellow("r5");
        Label lblDep = new Label("Oficina: ");
        lblDep.setStyle("font-weight:bold");
        rwDep.appendChild(lblDep);
        rwDep.appendChild(new Label(edfcg.getNomEspacio()));
       
    }

    /**
     * Crea un objeto grid, en donde se visualizara la informacion del cargo
     */
    private void createGridInfo() {
        Grid grdInfo = (Grid) getFellow("grdInformacion");
        Rows rws = grdInfo.getRows();
        if (rws != null) {
            cleanRows(rws);
        } else {
            rws = new Rows();
        }
        for (int i = 0; i < 6; i++) {
            Row r = new Row();
            r.setId("r" + i);
            r.setParent(rws);
        }
        rws.setParent(grdInfo);
    }

    /**
     * Borra el contenido del grid
     * @param rows rows con la estructura del grid
     */
    private void cleanRows(Rows rows) {
        if (rows != null) {
            int numRow = rows.getVisibleItemCount();
            List<Row> lst = rows.getChildren();
            for (int i = numRow - 1; i >= 0; i--) {
                rows.removeChild(lst.get(i));
            }
        }
    }

    /**
     * Realiza la consulta de dependencias de acuerdo al tipo de cargo
     */
    private void consultaDependencias() {
        em = emf.createEntityManager();
        List<TipoCargo> ltipo = new ArrayList<TipoCargo>();
        ltipo = em.createNamedQuery("TipoCargo.findAll").getResultList();
        em.close();
        for (TipoCargo tc : ltipo) {
            tch.appendChild(addDependencia(tc.getIdTipocargo(), tc.getNomTipocargo()));
        }
        this.appendChild(tch);
    }

    /**
     * Metodo que retorna un treeitem con la informacion del cargo
     * @param idTipoCargo identificador unico del tipo de cargo
     * @param nomTipoCargo nombre del tipo de cargo
     * @return
     */
    private Treeitem addDependencia(int idTipoCargo, String nomTipoCargo) {
        List<String> l = new LinkedList<String>();
        l = new ArrayList<String>();
        l.add((String) nomTipoCargo);

        Treeitem tim = new Treeitem();
        Treerow tro = new Treerow();
        Treecell tcl = null;
        for (int i = 0; i < l.size(); i++) {
            tcl = new Treecell();
            tcl.setLabel(l.get(i));
            tro.appendChild(tcl);
        }

        tro.appendChild(tcl);
        tim.appendChild(tro);

        Treechildren tchsub = consultaCargos(idTipoCargo);
        List lch = tchsub.getChildren();
        if (lch.size() > 0) {
            tim.appendChild(tchsub);
            tim.setOpen(false);
        }
        return tim;
    }

    /**
     * Retorna un treechildren con la informacion del cargo
     * @param idTipoCargo identificador unico del tipo de cargo
     * @return
     */
    private Treechildren consultaCargos(int idTipoCargo) {
        int contador = 0;
        boolean esPar = true;

        Treechildren tchd = new Treechildren();

        em = emf.createEntityManager();
        List<EdfCargo> lcargo = new ArrayList<EdfCargo>();
        lcargo = em.createNamedQuery("EdfCargo.findByIdTipocargo").setParameter("idTipocargo", idTipoCargo).getResultList();
        em.close();
        for (EdfCargo ec : lcargo) {
            esPar = !esPar;
            tchd.appendChild(newChildEdfCargos(ec.getNomCargo(), ec.getIdCargo(), esPar));
        }
        return tchd;
    }

    /**
     * Retorna un treeitem, con la informacion del nombre del cargo
     * @param nomCargos nombre del cargo
     * @param idCargo identificador del cargo
     * @param par define si es par o impar para la simbologia en el tree
     * @return
     */
    private Treeitem newChildEdfCargos(String nomCargos, int idCargo, boolean par) {

        Treeitem tim = new Treeitem();
        Treerow tro = new Treerow();
        Treecell tcl = new Treecell();
        if (par) {
            tro.setStyle("background-color:#f3e7cc");
        }

        tcl.setLabel(nomCargos);
        tcl.setId(idCargo + "");
        tro.appendChild(tcl);
        tim.appendChild(tro);

        return tim;
    }
}
