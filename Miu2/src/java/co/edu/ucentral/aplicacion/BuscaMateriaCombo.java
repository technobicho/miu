/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import co.edu.ucentral.modelo.UccVwasignaturamapa;
import co.edu.ucentral.modelo.UccVwmallamapainteractivo;
import co.edu.ucentral.modelo.UccVwprofesormapa;
import co.edu.ucentral.tools.CalculaPeriodo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Comboitem;
import org.zkoss.zul.Messagebox;

/**
 * Clase que extiende de un Combobox, el cual es inicializado de acuerdo
 * a la consulta realizada y a los resultados obtenidos de la vista
 * proporcionada por universitas
 * @author David Acosta
 * @version 1.0
 */
public class BuscaMateriaCombo extends Combobox implements EventListener {

    private static final long serialVersionUID = -93994895308723783L;
    private EntityManagerFactory emf;
    private EntityManager em;

    /**
     * Metodo que inicializa y sobrecarga el objeto Combobox
     */
    public void onCreate() {
        this.setDisabled(true);
        this.setValue("---------------------------------");
        this.addEventListener("onSelect", this);
        emf = Persistence.createEntityManagerFactory("Miu2PU3");
    }

    /**
     * Metodo que administra los eventos del objeto Combobox
     * @param arg0
     * @throws Exception
     */
    public void onEvent(Event arg0) throws Exception {
        //evento de tipo seleccion de un item
        if (arg0.getName().equals("onSelect")) {
            Combobox cbx = (Combobox) arg0.getTarget();
            Comboitem cbi = cbx.getSelectedItem();
            String idAsignatura =(String) cbi.getValue();

            //consulta informacion de horario
            em = emf.createEntityManager();
            List<UccVwmallamapainteractivo> lsthr = new ArrayList<UccVwmallamapainteractivo>();
            lsthr = em.createNamedQuery("UccVwmallamapainteractivo.profesorByMateria")
                    .setParameter("codigoasignatura", idAsignatura)
                    .setParameter("periodo",new CalculaPeriodo().getPeriodo())
                    .getResultList();

            em.clear();

             List<UccVwprofesormapa> lstprf = new ArrayList<UccVwprofesormapa>();

            for (Iterator i = lsthr.iterator(); i.hasNext();){
              String values = i.next().toString();
                UccVwprofesormapa prf = (UccVwprofesormapa) em.createNamedQuery("UccVwprofesormapa.findByDocumento")
                     .setParameter("documento", values + "").getSingleResult();
                lstprf.add(prf);
                em.clear();
            }
            em.close();
            
            BuscaDocenteCombo bdc = (BuscaDocenteCombo) getFellow("cbxDocente");
            bdc.createComboitems(lstprf);

        }
    }

    /**
     * Define y sobre escribe el contenido del Combobox
     * @param texto
     */
    public void setComboitems(String texto) {
        em = emf.createEntityManager();
        List<UccVwasignaturamapa> list = new ArrayList<UccVwasignaturamapa>();
        list =em.createNamedQuery("UccVwasignaturamapa.findByNombreasignatura")
                .setParameter("nombreasignatura", "%"+texto.toLowerCase()+"%")
                .getResultList();
        em.close();
        try{
            if(list.isEmpty()){
                this.setDisabled(true);
                Messagebox.show("No se encuentran resultados", "información", Messagebox.OK, Messagebox.INFORMATION);
                this.setValue("------------------------------");
            }else{
                this.setDisabled(false);
                this.getItems().clear();
                for(UccVwasignaturamapa lstAsignaturas : list){
                    Comboitem cbi = new Comboitem();
                    cbi.setLabel(lstAsignaturas.getCodigoasignatura() + "," + lstAsignaturas.getNombreasignatura());
                    cbi.setValue(lstAsignaturas.getCodigoasignatura());
                    cbi.setParent(this);
                }
                this.setValue("Seleccione");
            }
        }catch (InterruptedException ex) {
            Logger.getLogger(BuscaLista.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
