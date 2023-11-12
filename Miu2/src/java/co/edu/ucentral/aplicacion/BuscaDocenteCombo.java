/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.EdfEquivalente;
import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.UccVwmallamapainteractivo;
import co.edu.ucentral.modelo.UccVwprofesormapa;
import co.edu.ucentral.tools.CalculaPeriodo;
import co.edu.ucentral.tools.LocalizarEnMapa;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zhtml.Messagebox;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zkex.zul.Borderlayout;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Comboitem;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Panel;
import org.zkoss.zul.Row;
import org.zkoss.zul.Rows;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Toolbarbutton;

/**
 * Clase que hereda de un Combobox y su lista es creada
 * a partir de una consulta a la base de datos de universitas
 * @author David Acosta
 * @version 1.0
 */
public class BuscaDocenteCombo extends Combobox implements EventListener {

    private static final long serialVersionUID = 5862724944223004438L;
    private EntityManagerFactory emf, emf2;
    private EntityManager em, em2;
    String[][][] celdas = null;

    /**
     * Metodo que al crear el componente inicializa el
     * entity manager factory de cada conexion
     */
    public void onCreate() {
        this.setDisabled(true);
        this.setValue("--------------------------------");
        this.addEventListener("onSelect", this);
        emf = Persistence.createEntityManagerFactory("Miu2PU3");
        emf2 = Persistence.createEntityManagerFactory("Miu2PU");
    }

    /**
     * Metodo que gestiona los eventos sobre el componente
     * @param arg0
     * @throws Exception
     */
    public void onEvent(Event arg0) throws Exception {
        //Evento de seleccion
        if (arg0.getName().equals("onSelect")) {
            Combobox cbx = (Combobox) arg0.getTarget();
            Comboitem cbi = cbx.getSelectedItem();
            String idDocente = cbi.getValue().toString();

            //consulta informacion de horario
            em = emf.createEntityManager();
            List<UccVwmallamapainteractivo> lsthr = new ArrayList<UccVwmallamapainteractivo>();
            String sql = "SELECT u.idedificio, u.nombreasignatura , u.aula, u.diasemana, u.hora, u.duracion " +
                    "FROM UccVwmallamapainteractivo u " +
                    "WHERE u.documentoprofesor = ?1 AND u.periodo = ?2";
            CalculaPeriodo cp = new CalculaPeriodo();
            lsthr = em.createQuery(sql).setParameter(1, idDocente).setParameter(2, cp.getPeriodo()).getResultList();

            //alimenta la tabla de horario
            setHorario(lsthr);
        }
        //Evento de click sobre los Toolbarbutton del horario
        if (arg0.getName().equals("onClick")) {
            Toolbarbutton btn = (Toolbarbutton) arg0.getTarget();
            String idEdf = (String) btn.getAttribute("idEdf");
            String nomMat = (String) btn.getAttribute("nomMat");
            String salon = (String) btn.getAttribute("nomAula");
            String dura = (String) btn.getAttribute("dura") + " horas";

            //Crea y consulta la informacion de edificio
            EdificioInfo edfinf = edfinfo(idEdf);

            updateInfo(nomMat, salon, edfinf.getNomEdificio(), dura);

            //cierra paneles izquierdos
            Panel pe = (Panel) getFellow("pEdificios");
            pe.setOpen(false);
            Panel pd1 = (Panel) getFellow("pDependencias");
            pd1.setOpen(false);
            Panel pz = (Panel) getFellow("pZonas");
            pz.setOpen(false);

            //Selecciona tab de buscar espacio
            Tab tb = (Tab) getFellow("tbMapa");
            tb.setSelected(true);

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


            //abre el panel de dependencia
            Panel x = (Panel) getFellow("pDepen");
            x.setVisible(true);
            x.setOpen(true);



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
     * Configura el contenido del Combobox de acuerdo
     * a los criterios de busqueda ingresados
     * @param texto
     */
    public void setComboitems(String texto) {
        em = emf.createEntityManager();
        List<UccVwprofesormapa> list = new ArrayList<UccVwprofesormapa>();
        list = em.createNamedQuery("UccVwprofesormapa.findByNombres").setParameter("nombres", "%" + texto.toLowerCase() + "%").getResultList();
        em.close();
        this.getItems().clear();
        this.setValue("");
        try {
            if (list.isEmpty()) {
                this.setDisabled(true);
                Messagebox.show("No se encuentran resultados", "información", Messagebox.OK, Messagebox.INFORMATION);
                this.setValue("-----------------------------------");
            } else {
                createComboitems(list);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(BuscaLista.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * De acuerdo al resultado de la consulta se crea
     * cada uno de los item de la lista del Combobox
     * @param list
     */
    public void createComboitems(List<UccVwprofesormapa> list) {
        this.getItems().clear();
        this.setValue("");
        if (list.isEmpty()) {
            this.setDisabled(true);
            this.setValue("-----------------------------------");
        } else {
            this.setDisabled(false);
            for (UccVwprofesormapa lstProfesores : list) {
                Comboitem cbi = new Comboitem();
                cbi.setLabel(lstProfesores.getNombres());
                cbi.setValue(lstProfesores.getDocumento());
                cbi.setParent(this);
            }
            this.setValue("Seleccione");
        }

    }

    /**
     * Crea y carga la informacion del horario
     * @param lsthr
     */
    private void setHorario(List<UccVwmallamapainteractivo> lsthr) {
        celdas = new String[8][16][6];

        Hashtable dias = new Hashtable();
        dias.put("Lunes", new Integer(1));
        dias.put("Martes", new Integer(2));
        dias.put("Miercoles", new Integer(3));
        dias.put("Jueves", new Integer(4));
        dias.put("Viernes", new Integer(5));
        dias.put("Sabado", new Integer(6));
        dias.put("Domingo", new Integer(7));

        //inicializa el indice de horas
        for (int i = 0; i <= 15; i++) {
            celdas[0][i][0] = new String(i + 7 + ":00");
        }

        for (Iterator i = lsthr.iterator(); i.hasNext();) {
            Object[] valores = (Object[]) i.next();
            String[] datos = new String[6];
            if (valores[0] != null) {
                datos[0] = valores[0].toString();                               //idedificio
            } else {
                datos[0] = "0";
            }
            datos[1] = valores[1].toString();                                   //nombreasignatura
            datos[2] = valores[2].toString();                                   //aula
            if (dias.containsKey(valores[3].toString())) {                      //diasemana
                datos[3] = dias.get(valores[3].toString()).toString();
            } else {
                datos[3] = "0";
            }
            datos[4] = valores[4].toString().substring(0, 2);                   //hora
            datos[5] = valores[5].toString();                                   //duracion
            setRows(datos);
        }

        Grid grd = (Grid) getFellowIfAny("grdHorario");
        Rows rws = grd.getRows();
        if (rws != null) {
            cleanRows(rws);
        } else {
            rws = new Rows();
        }
        for (int i = 0; i < 16; i++) {
            Row r = new Row();
            for (int j = 0; j < 8; j++) {
                if (celdas[j][i][0] != null) {
                    if (j == 0) {
                        Label lh = new Label();
                        lh.setValue(celdas[j][i][0]);
                        lh.setWidth("50px");
                        r.appendChild(lh);
                        r.setWidth("50px");
                    } else if (!celdas[j][i][0].equals("0")) {
                        EdificioInfo ef = edfinfo(celdas[j][i][0]);
                        Toolbarbutton btn = new Toolbarbutton(ef.getNomEdificio() + "\n" + celdas[j][i][2]);
                        btn.setWidth("90px");
                        btn.addEventListener("onClick", this);
                        btn.setAttribute("idEdf", celdas[j][i][0]);
                        btn.setAttribute("nomMat", celdas[j][i][1]);
                        btn.setAttribute("nomAula", celdas[j][i][2]);
                        btn.setAttribute("dura", celdas[j][i][5]);
                        r.appendChild(btn);
                        r.setWidth("100px");
                    } else {
                        Label lbl = new Label(celdas[j][i][2]);
                        lbl.setWidth("90px");
                        r.appendChild(lbl);
                    }
                } else {
                    Label lbl = new Label("");
                    lbl.setWidth("100px");
                    r.appendChild(lbl);
                    r.setWidth("100px");
                }
            }
            rws.appendChild(r);
        }
        rws.setParent(grd);
    }

    /**
     * Consulta la informacion asociada al id del edificio
     * @param idEdf
     * @return
     */
    private EdificioInfo edfinfo(String idEdf) {
        em2 = emf2.createEntityManager();
        EdfEquivalente edfeq = (EdfEquivalente) em2.createNamedQuery("EdfEquivalente.findByIdEdfUniversitas").setParameter("idEdfUniversitas", idEdf).getSingleResult();
        em2.clear();
        EdificioInfo edfinf = (EdificioInfo) em2.createNamedQuery("EdificioInfo.findByIdEdificio").setParameter("idEdificio", edfeq.getIdEdificioMiu()).getSingleResult();
        em2.close();
        return edfinf;
    }

    /**
     * Actualiza la informacion que sera publicada en el
     * horario
     * @param materia Nombre de la materia
     * @param salon Salon en el cual se dicta la materia
     * @param Edificio Edificio en el cual se encuentra el Salon
     * @param duracion Tiempo de duracion de la clase
     */
    private void updateInfo(String materia, String salon, String Edificio, String duracion) {
        Panel pnlInfo = (Panel) getFellow("pDepen");
        pnlInfo.setTitle("Información");

        //crea la estructura del Grid
        createGridInfo();

        Row rwCargo = (Row) getFellow("r0");
        Label lblCargo = new Label("Edificio: ");
        lblCargo.setStyle("font-weight:bold");
        rwCargo.appendChild(lblCargo);
        rwCargo.appendChild(new Label(Edificio));

        Row rwNombre = (Row) getFellow("r1");
        Label lblNombre = new Label("Salon: ");
        lblNombre.setStyle("font-weight:bold");
        rwNombre.appendChild(lblNombre);
        rwNombre.appendChild(new Label(salon));

        Row rwSede = (Row) getFellow("r2");
        Label lblSede = new Label("Materia: ");
        lblSede.setStyle("font-weight:bold");
        rwSede.appendChild(lblSede);
        rwSede.appendChild(new Label(materia));

        Row rwEdf = (Row) getFellow("r3");
        Label lblEdf = new Label("Duracion: ");
        lblEdf.setStyle("font-weight:bold");
        rwEdf.appendChild(lblEdf);
        rwEdf.appendChild(new Label(duracion));
    }

    /**
     * Crea y configura el grid que contiene el horario
     */
    private void createGridInfo() {
        Grid grdInfo = (Grid) getFellow("grdInformacion");
        Rows rws = grdInfo.getRows();
        if (rws != null) {
            cleanRows(rws);
        } else {
            rws = new Rows();
        }
        for (int i = 0; i < 5; i++) {
            Row r = new Row();
            r.setId("r" + i);
            r.setParent(rws);
        }
        rws.setParent(grdInfo);
    }

    /**
     * Limpia las filas del grid
     * @param rows
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
     * Carga los datos en cada una de las filas del grid
     * que contiene el horario.
     * @param datos
     */
    private void setRows(String[] datos) {
        int dia = Integer.parseInt(datos[3]);
        int hora = Integer.parseInt(datos[4]);

        if (dia > 0 && dia < 7) {
            if (hora > 6 && hora < 23) {
                celdas[dia][hora - 7][0] = datos[0];
                celdas[dia][hora - 7][1] = datos[1];
                celdas[dia][hora - 7][2] = datos[2];
                celdas[dia][hora - 7][3] = datos[3];
                celdas[dia][hora - 7][4] = datos[4];
                celdas[dia][hora - 7][5] = datos[5];
            }
        }
    }
}
