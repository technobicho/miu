/*
 * MapaAdminView.java
 */
package mapaadmin;

import org.jdesktop.application.Action;
import org.jdesktop.application.ResourceMap;
import org.jdesktop.application.SingleFrameApplication;
import org.jdesktop.application.FrameView;
import org.jdesktop.application.TaskMonitor;
import org.jdesktop.application.Task;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManagerFactory;
import javax.persistence.RollbackException;
import javax.swing.Timer;
import javax.swing.Icon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import mapaadmin.Closer;
import mapaadmin.MapaAdminApp;
import mapaadmin.dao.EdificioEspacio;
import mapaadmin.gui.JDNewBuilding;
import mapaadmin.gui.JDNewCargo;
import mapaadmin.gui.JDNewFloor;
import mapaadmin.gui.JDNewFuncionario;
import mapaadmin.gui.JDNewSede;
import mapaadmin.gui.JDNewSpace;
import mapaadmin.gui.JDNewTipoCargo;
import mapaadmin.gui.JDNewType;
import mapaadmin.gui.JDNewUsos;
import mapaadmin.gui.JDZonas;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jdesktop.beansbinding.AbstractBindingListener;
import org.jdesktop.beansbinding.Binding;
import org.jdesktop.beansbinding.PropertyStateEvent;

/**
 * Esta es la aplicacion del frame principal
 */
public class MapaAdminView extends FrameView {

    private Map<String, String> properties;
    //Objeto que administra los logs
    private static Logger logger = Logger.getLogger(MapaAdminView.class);
    private JFrame mainFrame;
    private String usuario;

    /**
     * Constructor del frame principal
     * @param app
     * @param properties
     */
    public MapaAdminView(SingleFrameApplication app, Map<String,String> properties) {
        super(app);

        this.properties = properties;
        
        //Configuracion para log4j
        URL url = MapaAdminView.class.getResource("resources/Log4jPostgres.properties");
        PropertyConfigurator.configure(url);
        

        mainFrame = MapaAdminApp.getApplication().getMainFrame();
        properties = new HashMap<String, String>();

        initComponents();

        //Garantiza el la finalizacion de la aplicacion
        this.getFrame().setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        this.getFrame().addWindowListener(new Closer());

        //Inicializacion de la barra de estado - mensaje de fuera de tiempo
        //animacion del icono de trabajo, etc
        ResourceMap resourceMap = getResourceMap();
        int messageTimeout = resourceMap.getInteger("StatusBar.messageTimeout");
        messageTimer = new Timer(messageTimeout, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                statusMessageLabel.setText("");
            }
        });

        messageTimer.setRepeats(false);
        int busyAnimationRate = resourceMap.getInteger("StatusBar.busyAnimationRate");
        for (int i = 0; i < busyIcons.length; i++) {
            busyIcons[i] = resourceMap.getIcon("StatusBar.busyIcons[" + i + "]");
        }

        busyIconTimer = new Timer(busyAnimationRate, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                busyIconIndex = (busyIconIndex + 1) % busyIcons.length;
                statusAnimationLabel.setIcon(busyIcons[busyIconIndex]);
            }
        });

        idleIcon = resourceMap.getIcon("StatusBar.idleIcon");
        statusAnimationLabel.setIcon(idleIcon);
        progressBar.setVisible(false);

        // conexión de las tareas de acción para la barra de estado a través de TaskMonitor
        TaskMonitor taskMonitor = new TaskMonitor(getApplication().getContext());
        taskMonitor.addPropertyChangeListener(new java.beans.PropertyChangeListener() {

            @Override
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                String propertyName = evt.getPropertyName();
                if ("started".equals(propertyName)) {
                    if (!busyIconTimer.isRunning()) {
                        statusAnimationLabel.setIcon(busyIcons[0]);
                        busyIconIndex = 0;
                        busyIconTimer.start();
                    }
                    progressBar.setVisible(true);
                    progressBar.setIndeterminate(true);
                } else if ("done".equals(propertyName)) {
                    busyIconTimer.stop();
                    statusAnimationLabel.setIcon(idleIcon);
                    progressBar.setVisible(false);
                    progressBar.setValue(0);
                } else if ("message".equals(propertyName)) {
                    String text = (String) (evt.getNewValue());
                    statusMessageLabel.setText((text == null) ? "" : text);
                    messageTimer.restart();
                } else if ("progress".equals(propertyName)) {
                    int value = (Integer) (evt.getNewValue());
                    progressBar.setVisible(true);
                    progressBar.setIndeterminate(false);
                    progressBar.setValue(value);
                }
            }
        });

        //seguimiento de selección de la tabla
        tablaEdificios.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("recordSelected", !isRecordSelected(), isRecordSelected());
                    }
                });
        tablaPisos.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("detailRecordSelected", !isDetailRecordSelected(), isDetailRecordSelected());
                    }
                });
        tablaEspacios.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("espacioRecordSelected", !isEspacioRecordSelected(), isEspacioRecordSelected());
                    }
                });
        tablaFuncionarios.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("funcionarioRecordSelected", !isFuncionarioRecordSelected(), isFuncionarioRecordSelected());
                    }
                });

        // Seguimiento de cambios a save
        bindingGroup.addBindingListener(new AbstractBindingListener() {

            @Override
            public void targetChanged(Binding binding, PropertyStateEvent event) {
                // salva accion observa propiedad saveNeeded
                setSaveNeeded(true);
            }
        });

        // Inicia una operacion de transaccion
        entityManager.getTransaction().begin();

    }

    public boolean isSaveNeeded() {
        return saveNeeded;
    }

    private void setSaveNeeded(boolean saveNeeded) {
        if (saveNeeded != this.saveNeeded) {
            this.saveNeeded = saveNeeded;
            firePropertyChange("saveNeeded", !saveNeeded, saveNeeded);
        }
    }

    public boolean isRecordSelected() {
        return tablaEdificios.getSelectedRow() != -1;
    }

    public boolean isDetailRecordSelected() {
        return tablaPisos.getSelectedRow() != -1;
    }

    public boolean isEspacioRecordSelected() {
        return tablaEspacios.getSelectedRow() != -1;
    }

    public boolean isFuncionarioRecordSelected() {
        return tablaFuncionarios.getSelectedRow() != -1;
    }

    /**
     * Metodo que crea un nuevo registro de edificio
     */
    @Action
    public void nuevoEdificio() {

        //crea nuevo objeto EdificioInfo
        mapaadmin.dao.EdificioInfo E = new mapaadmin.dao.EdificioInfo();
        entityManager.persist(E);
        listaEdificios.add(E);

        //Cuenta el numero de filas en la tabla principal
        int row = tablaEdificios.getRowCount() - 1;
        tablaEdificios.setRowSelectionInterval(row, row);
        tablaEdificios.scrollRectToVisible(tablaEdificios.getCellRect(row, 0, true));

        //setSaveNeeded(true);
        //Crea y visualiza el frame de captura de datos        
        JDNewBuilding ce = new JDNewBuilding(mainFrame, true);
        ce.setCurrentRecord(E);
        ce.setLocationRelativeTo(mainFrame);
        ce.setVisible(true);

        //valida respuesta del frame
        if (ce.isEdificioConfirmed()) {
            save().run();
            logger.info("nuevo edificio: " + ce.getName());
        } else {
            refresh().run();
        }
    }

    /**
     * Metodo que borra registros de edificio
     */
    @Action(enabledProperty = "recordSelected")
    public void borraEdificio() {
        int n = JOptionPane.showConfirmDialog(null,
                "¿Desea borrar el registro de forma permanente?\n" +
                "Esto borrara todos los elementos asociados!", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);

        if (n == JOptionPane.YES_OPTION) {
            int[] selected = tablaEdificios.getSelectedRows();
            List<mapaadmin.dao.EdificioInfo> toRemove = new ArrayList<mapaadmin.dao.EdificioInfo>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                mapaadmin.dao.EdificioInfo c = listaEdificios.get(tablaEdificios.convertRowIndexToModel(selected[idx]));
                logger.info("borra edificio: " + c.getNomEdificio());                
                toRemove.add(c);
                entityManager.remove(c);
            }
            listaEdificios.removeAll(toRemove);
            save().run();
        }
    }

    /**
     * Registra un nuevo piso
     */
    @Action(enabledProperty = "recordSelected")
    public void nuevoPiso() {
        //identifica el indice del edificio seleccionado
        int index = tablaEdificios.getSelectedRow();

        //crea un nuevo EdificioInfo de acuerdo al indice
        mapaadmin.dao.EdificioInfo E = listaEdificios.get(tablaEdificios.convertRowIndexToModel(index));

        //Crea una collection con todos los pisos asociados al edificio
        Collection<mapaadmin.dao.EdificioPiso> es = E.getEdificioPisoCollection();
        if (es == null) {
            es = new LinkedList<mapaadmin.dao.EdificioPiso>();
            E.setEdificioPisoCollection((List<mapaadmin.dao.EdificioPiso>) es);
        }

        //Crea un nuveo EdificioPiso y lo persiste
        mapaadmin.dao.EdificioPiso e = new mapaadmin.dao.EdificioPiso();
        entityManager.persist(e);
        e.setIdEdificio(E);
        //agrega el piso al edificio
        es.add(e);

        tablaEdificios.clearSelection();
        tablaEdificios.setRowSelectionInterval(index, index);
        int row = es.size() - 1;
        tablaPisos.setRowSelectionInterval(row, row);
        tablaPisos.scrollRectToVisible(tablaPisos.getCellRect(row, 0, true));
        //setSaveNeeded(true);

        //crea un nuevo frame de captura de los datos para el piso
        JDNewFloor ce = new JDNewFloor(mainFrame, true);
        ce.setCurrentRecord(e);
        ce.setLocationRelativeTo(mainFrame);
        ce.setVisible(true);

        //valida respuesta del frame
        if (ce.isPisoConfirmed()) {
            logger.info("nuevo Piso: " + ce.getName());
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(index, index);
        }
    }

    /**
     * Borra registro de piso
     */
    @Action(enabledProperty = "detailRecordSelected")
    public void borraPiso() {
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            //identifica el edificio seleccionado
            int index = tablaEdificios.getSelectedRow();
            mapaadmin.dao.EdificioInfo E = listaEdificios.get(tablaEdificios.convertRowIndexToModel(index));
            Collection<mapaadmin.dao.EdificioPiso> ep = E.getEdificioPisoCollection();
            int[] selected = tablaPisos.getSelectedRows();
            //lista los pisos a remover
            List<mapaadmin.dao.EdificioPiso> toRemove = new ArrayList<mapaadmin.dao.EdificioPiso>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                selected[idx] = tablaPisos.convertRowIndexToModel(selected[idx]);
                int count = 0;
                Iterator<mapaadmin.dao.EdificioPiso> iter = ep.iterator();
                while (count++ < selected[idx]) {
                    iter.next();
                }
                mapaadmin.dao.EdificioPiso e = iter.next();
                logger.info("borra piso: " + e.getNomPiso());
                toRemove.add(e);
                entityManager.remove(e);
            }
            ep.removeAll(toRemove);
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(index, index);
            //setSaveNeeded(true);
            save().run();
        }
    }

    /**
     * Accion para nuevos registros en la tabla espacios
     */
    @Action(enabledProperty = "detailRecordSelected")
    public void nuevoEspacio() {
        //identifica el edificio seleccionado
        int indexEdf = tablaEdificios.getSelectedRow();
        mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
        //lista los pisos asociados
        Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
        List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
        int indexPiso = tablaPisos.getSelectedRow();
        //lista los espacios asociados
        mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(indexPiso));
        List<EdificioEspacio> es = E.getEdificioEspacioCollection();
        if (es == null) {
            es = new LinkedList<EdificioEspacio>();
            E.setEdificioEspacioCollection(es);
        }
        //crea un nuevo espacio
        mapaadmin.dao.EdificioEspacio e = new mapaadmin.dao.EdificioEspacio();
        entityManager.persist(e);
        e.setIdPiso(E);
        es.add(e);
        tablaPisos.clearSelection();
        tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
        int row = es.size() - 1;
        tablaEspacios.setRowSelectionInterval(row, row);
        tablaEspacios.scrollRectToVisible(tablaEspacios.getCellRect(row, 0, true));
        //setSaveNeeded(true);
        //Crea nuevo formulario de captura para espacio
        JDNewSpace sp = new JDNewSpace(mainFrame, true);
        sp.setCurrentRecord(e);
        sp.setLocationRelativeTo(mainFrame);
        sp.setVisible(true);
        //valida respuesta del formulario
        if (sp.isEspacioConfirmed()) {
            logger.info("nuevo espacio: " + sp.getName());
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
        }
    }

    /**
     * Metodo que borra espacios
     */
    @Action(enabledProperty = "espacioRecordSelected")
    public void borraEspacio() {
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            //identifica el edificio seleccionado
            int indexEdf = tablaEdificios.getSelectedRow();
            mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
            //lista los pisos del edificio
            Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
            List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
            int index = tablaPisos.getSelectedRow();
            //lista los espacios asociados al piso
            mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(index));
            Collection<EdificioEspacio> es = E.getEdificioEspacioCollection();
            int[] selected = tablaEspacios.getSelectedRows();
            //lista los espacios a remover
            List<EdificioEspacio> toRemove = new ArrayList<EdificioEspacio>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                selected[idx] = tablaEspacios.convertRowIndexToModel(selected[idx]);
                int count = 0;
                Iterator<EdificioEspacio> iter = es.iterator();
                while (count++ < selected[idx]) {
                    iter.next();
                }
                EdificioEspacio e = iter.next();
                logger.info("borra espacio: " + e.getNomEspacio());
                toRemove.add(e);
                entityManager.remove(e);
            }
            es.removeAll(toRemove);
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(index, index);
            //setSaveNeeded(true);
            save().run();
        }
    }

    /**
     * Metodo que crea un nuevo funcionario
     */
    @Action(enabledProperty = "espacioRecordSelected")
    public void nuevoFuncionario() {
        //identifica el edificio seleccionado
        int indexEdf = tablaEdificios.getSelectedRow();
        mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
        //lista de pisos asociados al edificio
        Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
        List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
        int indexPiso = tablaPisos.getSelectedRow();
        //lista de espacios asociados al piso seleccionado
        mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(indexPiso));
        Collection<EdificioEspacio> es = E.getEdificioEspacioCollection();
        List<EdificioEspacio> ledfesp = (List<EdificioEspacio>) es;
        int indexEspacio = tablaEspacios.getSelectedRow();
        EdificioEspacio EE = ledfesp.get(tablaEspacios.convertRowIndexToModel(indexEspacio));
        //lista de funcionarios asociados al espacio
        Collection<mapaadmin.dao.Funcionario> ee = EE.getFuncionarioEspacioCollection();
        if (ee == null) {
            ee = new LinkedList<mapaadmin.dao.Funcionario>();
            EE.setFuncionarioEspacioCollection((List<mapaadmin.dao.Funcionario>) ee);
        }
        //crea un nuevo funcioanrio
        mapaadmin.dao.Funcionario fun = new mapaadmin.dao.Funcionario();
        entityManager.persist(fun);
        fun.setEdfEspacio(EE);
        ee.add(fun);
        tablaEspacios.clearSelection();
        tablaEspacios.setRowSelectionInterval(indexEspacio, indexEspacio);
        int row = ee.size() - 1;
        tablaFuncionarios.setRowSelectionInterval(row, row);
        tablaFuncionarios.scrollRectToVisible(tablaFuncionarios.getCellRect(row, 0, true));
        //setSaveNeeded(true);
        //crea formulario de captura para funcioanrios
        JDNewFuncionario ce = new JDNewFuncionario(mainFrame, true);
        ce.setCurrentRecord(fun);
        ce.setLocationRelativeTo(mainFrame);
        ce.setVisible(true);
        //valida respuesta funcionario
        if (ce.isFuncionarioConfirmed()) {
            logger.info("nuevo funcionario: " + ce.getName());
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
            tablaEspacios.clearSelection();
            tablaEspacios.setRowSelectionInterval(indexEspacio, indexEspacio);
        }
    }

    /**
     * Metodo que borra funcionarios
     */
    @Action(enabledProperty = "funcionarioRecordSelected")
    public void borraFuncionario() {
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            //identifica el edificio seleccionado
            int indexEdf = tablaEdificios.getSelectedRow();
            mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
            //lista de pisos asociados al edificio seleccionado
            Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
            List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
            int indexPiso = tablaPisos.getSelectedRow();
            mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(indexPiso));
            //lista de espacios asociados al piso seleccionado
            Collection<EdificioEspacio> es = E.getEdificioEspacioCollection();
            List<EdificioEspacio> ledfesp = (List<EdificioEspacio>) es;
            int indexEspacio = tablaEspacios.getSelectedRow();
            EdificioEspacio EE = ledfesp.get(tablaEspacios.convertRowIndexToModel(indexEspacio));
            //lista de funcionarios asociados al espacio seleccionado
            Collection<mapaadmin.dao.Funcionario> ee = EE.getFuncionarioEspacioCollection();
            int[] selected = tablaFuncionarios.getSelectedRows();
            List<mapaadmin.dao.Funcionario> toRemove = new ArrayList<mapaadmin.dao.Funcionario>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                selected[idx] = tablaFuncionarios.convertRowIndexToModel(selected[idx]);
                int count = 0;
                Iterator<mapaadmin.dao.Funcionario> iter = ee.iterator();
                while (count++ < selected[idx]) {
                    iter.next();
                }
                mapaadmin.dao.Funcionario e = iter.next();
                logger.info("borra funcionario: " + e);
                toRemove.add(e);
                entityManager.remove(e);
            }
            es.removeAll(toRemove);
            setSaveNeeded(true);
            save().run();
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
            tablaEspacios.clearSelection();
            tablaEspacios.setRowSelectionInterval(indexEspacio, indexEspacio);
        }
    }

    @Action(enabledProperty = "saveNeeded")
    public Task save() {
        return new SaveTask(getApplication());
    }

    private class SaveTask extends Task {

        SaveTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @Override
        protected Void doInBackground() {
            try {
                entityManager.getTransaction().commit();
                entityManager.getTransaction().begin();
            } catch (RollbackException rex) {
                logger.error("Causa Error: " + rex.getCause());
                JOptionPane.showMessageDialog(null, "Error no se pudo guardar el registro!",
                        "Error", JOptionPane.ERROR_MESSAGE);
                entityManager.getTransaction().begin();
                List<mapaadmin.dao.EdificioInfo> merged = new ArrayList<mapaadmin.dao.EdificioInfo>(listaEdificios.size());
                for (mapaadmin.dao.EdificioInfo E : listaEdificios) {
                    merged.add(entityManager.merge(E));
                }
                listaEdificios.clear();
                listaEdificios.addAll(merged);
            }
            return null;
        }

        @Override
        protected void finished() {
            setSaveNeeded(false);
        }
    }

    /**
     * An example action method showing how to create asynchronous tasks
     * (running on background) and how to show their progress. Note the
     * artificial 'Thread.sleep' calls making the task long enough to see the
     * progress visualization - remove the sleeps for real application.
     */
    @Action
    public Task refresh() {
        return new RefreshTask(getApplication());
    }

    private class RefreshTask extends Task {

        RefreshTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @SuppressWarnings("unchecked")
        @Override
        protected Void doInBackground() {
//            try {
            setProgress(0, 0, 4);
            setMessage("Retrasando los cambios actuales...");
            setProgress(1, 0, 4);
            entityManager.getTransaction().rollback();
//                Thread.sleep(1000L); // remove for real app
            setProgress(2, 0, 4);

            setMessage("Iniciando nueva transaccion...");
            entityManager.getTransaction().begin();
//                Thread.sleep(500L); // remove for real app
            setProgress(3, 0, 4);

            setMessage("Obtención de nuevos datos...");
            java.util.Collection data = query.getResultList();
            for (Object entity : data) {
                entityManager.refresh(entity);
            }
//                Thread.sleep(1300L); // remove for real app
            setProgress(4, 0, 4);

//                Thread.sleep(150L); // remove for real app
            listaEdificios.clear();
            listaEdificios.addAll(data);
//            } catch (InterruptedException ignore) {
//            }
            return null;
        }

        @Override
        protected void finished() {
            setMessage("Hecho.");
            setSaveNeeded(false);
        }
    }

    @Action
    public void showAboutBox() {
        if (aboutBox == null) {
            aboutBox = new MapaAdminAboutBox(mainFrame);
            aboutBox.setLocationRelativeTo(mainFrame);
        }
        MapaAdminApp.getApplication().show(aboutBox);
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        bindingGroup = new org.jdesktop.beansbinding.BindingGroup();

        mainPanel = new javax.swing.JPanel();
        masterScrollPane = new javax.swing.JScrollPane();
        tablaEdificios = new javax.swing.JTable();
        newButton = new javax.swing.JButton();
        deleteButton = new javax.swing.JButton();
        detailScrollPane = new javax.swing.JScrollPane();
        tablaPisos = new javax.swing.JTable();
        deleteDetailButton = new javax.swing.JButton();
        newDetailButton = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaEspacios = new javax.swing.JTable();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tablaFuncionarios = new javax.swing.JTable();
        refreshButton = new javax.swing.JButton();
        saveButton = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        menuBar = new javax.swing.JMenuBar();
        javax.swing.JMenu fileMenu = new javax.swing.JMenu();
        jSeparator1 = new javax.swing.JSeparator();
        javax.swing.JMenuItem saveMenuItem = new javax.swing.JMenuItem();
        javax.swing.JMenuItem refreshMenuItem = new javax.swing.JMenuItem();
        jSeparator2 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();
        javax.swing.JMenuItem exitMenuItem = new javax.swing.JMenuItem();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jmiCargos = new javax.swing.JMenuItem();
        jMenuItem6 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem5 = new javax.swing.JMenuItem();
        jSeparator3 = new javax.swing.JSeparator();
        javax.swing.JMenu helpMenu = new javax.swing.JMenu();
        javax.swing.JMenuItem aboutMenuItem = new javax.swing.JMenuItem();
        statusPanel = new javax.swing.JPanel();
        javax.swing.JSeparator statusPanelSeparator = new javax.swing.JSeparator();
        statusMessageLabel = new javax.swing.JLabel();
        statusAnimationLabel = new javax.swing.JLabel();
        progressBar = new javax.swing.JProgressBar();
        try{
            EntityManagerFactory emf = javax.persistence.Persistence.createEntityManagerFactory("ucentral2PU",properties);
            entityManager = emf.createEntityManager(properties);
            org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(MapaAdminView.class);
            query = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery(resourceMap.getString("query.query")); // NOI18N
            listaEdificios = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(query.getResultList());
            edificioEspacioQuery = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery("SELECT e FROM EdificioEspacio e");
            edificioEspacioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(edificioEspacioQuery.getResultList());
            edificioPisoQuery = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery(resourceMap.getString("edificioPisoQuery.query")); // NOI18N
            edificioPisoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(edificioPisoQuery.getResultList());
            funcionarioQuery = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery("SELECT f FROM Funcionario f");
            funcionarioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(funcionarioQuery.getResultList());
            rowSorterToStringConverter1 = new mapaadmin.RowSorterToStringConverter();

            mainPanel.setName("mainPanel"); // NOI18N

            masterScrollPane.setName("masterScrollPane"); // NOI18N

            tablaEdificios.setName("tablaEdificios"); // NOI18N

            org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, listaEdificios, tablaEdificios);
            org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${idEdificio}"));
            columnBinding.setColumnName("Id Edificio");
            columnBinding.setColumnClass(Integer.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomEdificio}"));
            columnBinding.setColumnName("Nom Edificio");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${direccion1}"));
            columnBinding.setColumnName("Direccion1");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${direccion2}"));
            columnBinding.setColumnName("Direccion2");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${fechaConstruccion}"));
            columnBinding.setColumnName("Fecha Construccion");
            columnBinding.setColumnClass(java.util.Date.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${ciudad.nomCiudad}"));
            columnBinding.setColumnName("Ciudad.nom Ciudad");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${sede.nomSede}"));
            columnBinding.setColumnName("Sede.nom Sede");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${descripcion}"));
            columnBinding.setColumnName("Descripcion");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${uso.nomTipoUso}"));
            columnBinding.setColumnName("Uso.nom Tipo Uso");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${picture}"));
            columnBinding.setColumnName("Picture");
            columnBinding.setEditable(false);
            bindingGroup.addBinding(jTableBinding);
            jTableBinding.bind();
            masterScrollPane.setViewportView(tablaEdificios);
            tablaEdificios.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title0")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(1).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title1")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(2).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title2")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(3).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title3")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(4).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title4")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(5).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title5")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(6).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title6")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(7).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title7")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(8).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title9")); // NOI18N
            tablaEdificios.getColumnModel().getColumn(9).setHeaderValue(resourceMap.getString("tablaEdificios.columnModel.title10")); // NOI18N

            javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(MapaAdminView.class, this);
            newButton.setAction(actionMap.get("nuevoEdificio")); // NOI18N
            newButton.setIcon(resourceMap.getIcon("newButton.icon")); // NOI18N
            newButton.setText(resourceMap.getString("newButton.text")); // NOI18N
            newButton.setToolTipText(resourceMap.getString("newButton.toolTipText")); // NOI18N
            newButton.setName("newButton"); // NOI18N

            deleteButton.setAction(actionMap.get("borraEdificio")); // NOI18N
            deleteButton.setIcon(resourceMap.getIcon("deleteButton.icon")); // NOI18N
            deleteButton.setText(resourceMap.getString("deleteButton.text")); // NOI18N
            deleteButton.setToolTipText(resourceMap.getString("deleteButton.toolTipText")); // NOI18N
            deleteButton.setName("deleteButton"); // NOI18N

            detailScrollPane.setName("detailScrollPane"); // NOI18N

            tablaPisos.setAutoCreateRowSorter(true);
            tablaPisos.setName("tablaPisos"); // NOI18N

            org.jdesktop.beansbinding.ELProperty eLProperty = org.jdesktop.beansbinding.ELProperty.create("${selectedElement.edificioPisoCollection}");
            jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tablaEdificios, eLProperty, tablaPisos);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomPiso}"));
            columnBinding.setColumnName("Nom Piso");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${plano}"));
            columnBinding.setColumnName("Plano");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            jTableBinding.setSourceUnreadableValue(java.util.Collections.emptyList());
            bindingGroup.addBinding(jTableBinding);
            jTableBinding.bind();
            detailScrollPane.setViewportView(tablaPisos);
            tablaPisos.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tablaPisos.columnModel.title0")); // NOI18N
            tablaPisos.getColumnModel().getColumn(1).setHeaderValue(resourceMap.getString("tablaPisos.columnModel.title1")); // NOI18N

            deleteDetailButton.setAction(actionMap.get("borraPiso")); // NOI18N
            deleteDetailButton.setIcon(resourceMap.getIcon("deleteDetailButton.icon")); // NOI18N
            deleteDetailButton.setText(resourceMap.getString("deleteDetailButton.text")); // NOI18N
            deleteDetailButton.setToolTipText(resourceMap.getString("deleteDetailButton.toolTipText")); // NOI18N
            deleteDetailButton.setName("deleteDetailButton"); // NOI18N

            newDetailButton.setAction(actionMap.get("nuevoPiso")); // NOI18N
            newDetailButton.setIcon(resourceMap.getIcon("newDetailButton.icon")); // NOI18N
            newDetailButton.setText(resourceMap.getString("newDetailButton.text")); // NOI18N
            newDetailButton.setToolTipText(resourceMap.getString("newDetailButton.toolTipText")); // NOI18N
            newDetailButton.setName("newDetailButton"); // NOI18N

            jButton1.setAction(actionMap.get("editEdificio")); // NOI18N
            jButton1.setIcon(resourceMap.getIcon("jButton1.icon")); // NOI18N
            jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
            jButton1.setToolTipText(resourceMap.getString("jButton1.toolTipText")); // NOI18N
            jButton1.setName("jButton1"); // NOI18N

            jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
            jLabel1.setName("jLabel1"); // NOI18N

            jTextField1.setToolTipText(resourceMap.getString("jTextField1.toolTipText")); // NOI18N
            jTextField1.setName("jTextField1"); // NOI18N

            org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tablaEdificios, org.jdesktop.beansbinding.ELProperty.create("${rowSorter}"), jTextField1, org.jdesktop.beansbinding.BeanProperty.create("text"));
            binding.setConverter(rowSorterToStringConverter1);
            bindingGroup.addBinding(binding);

            jScrollPane1.setName("jScrollPane1"); // NOI18N

            tablaEspacios.setAutoCreateRowSorter(true);
            tablaEspacios.setName("tablaEspacios"); // NOI18N

            eLProperty = org.jdesktop.beansbinding.ELProperty.create("${selectedElement.edificioEspacioCollection}");
            jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tablaPisos, eLProperty, tablaEspacios);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${espacioTipo.nomTipoEspacio}"));
            columnBinding.setColumnName("Espacio Tipo.nom Tipo Espacio");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomEspacio}"));
            columnBinding.setColumnName("Nom Espacio");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            jTableBinding.setSourceUnreadableValue(java.util.Collections.emptyList());
            bindingGroup.addBinding(jTableBinding);
            jTableBinding.bind();
            jScrollPane1.setViewportView(tablaEspacios);
            tablaEspacios.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tablaEspacios.columnModel.title0")); // NOI18N
            tablaEspacios.getColumnModel().getColumn(1).setHeaderValue(resourceMap.getString("tablaEspacios.columnModel.title1")); // NOI18N

            jButton2.setAction(actionMap.get("borraEspacio")); // NOI18N
            jButton2.setIcon(resourceMap.getIcon("jButton2.icon")); // NOI18N
            jButton2.setText(resourceMap.getString("jButton2.text")); // NOI18N
            jButton2.setName("jButton2"); // NOI18N

            jButton3.setAction(actionMap.get("nuevoEspacio")); // NOI18N
            jButton3.setIcon(resourceMap.getIcon("jButton3.icon")); // NOI18N
            jButton3.setText(resourceMap.getString("jButton3.text")); // NOI18N
            jButton3.setName("jButton3"); // NOI18N

            jButton4.setAction(actionMap.get("editPiso")); // NOI18N
            jButton4.setIcon(resourceMap.getIcon("jButton4.icon")); // NOI18N
            jButton4.setText(resourceMap.getString("jButton4.text")); // NOI18N
            jButton4.setToolTipText(resourceMap.getString("jButton4.toolTipText")); // NOI18N
            jButton4.setName("jButton4"); // NOI18N

            jButton5.setAction(actionMap.get("editEspacio")); // NOI18N
            jButton5.setIcon(resourceMap.getIcon("jButton5.icon")); // NOI18N
            jButton5.setText(resourceMap.getString("jButton5.text")); // NOI18N
            jButton5.setToolTipText(resourceMap.getString("jButton5.toolTipText")); // NOI18N
            jButton5.setName("jButton5"); // NOI18N

            jScrollPane2.setName("jScrollPane2"); // NOI18N

            tablaFuncionarios.setAutoCreateRowSorter(true);
            tablaFuncionarios.setName("tablaFuncionarios"); // NOI18N

            eLProperty = org.jdesktop.beansbinding.ELProperty.create("${selectedElement.funcionarioEspacioCollection}");
            jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tablaEspacios, eLProperty, tablaFuncionarios);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomFuncionario}"));
            columnBinding.setColumnName("Nom Funcionario");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${cargo.nomCargo}"));
            columnBinding.setColumnName("Cargo.nom Cargo");
            columnBinding.setColumnClass(String.class);
            columnBinding.setEditable(false);
            jTableBinding.setSourceUnreadableValue(java.util.Collections.emptyList());
            bindingGroup.addBinding(jTableBinding);
            jTableBinding.bind();
            jScrollPane2.setViewportView(tablaFuncionarios);
            tablaFuncionarios.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tablaFuncionarios.columnModel.title0")); // NOI18N
            tablaFuncionarios.getColumnModel().getColumn(1).setHeaderValue(resourceMap.getString("tablaFuncionarios.columnModel.title1")); // NOI18N

            refreshButton.setAction(actionMap.get("refresh")); // NOI18N
            refreshButton.setText(resourceMap.getString("refreshButton.text")); // NOI18N
            refreshButton.setName("refreshButton"); // NOI18N

            saveButton.setAction(actionMap.get("save")); // NOI18N
            saveButton.setText(resourceMap.getString("saveButton.text")); // NOI18N
            saveButton.setName("saveButton"); // NOI18N

            jButton6.setAction(actionMap.get("borraFuncionario")); // NOI18N
            jButton6.setIcon(resourceMap.getIcon("jButton6.icon")); // NOI18N
            jButton6.setText(resourceMap.getString("jButton6.text")); // NOI18N
            jButton6.setToolTipText(resourceMap.getString("jButton6.toolTipText")); // NOI18N
            jButton6.setName("jButton6"); // NOI18N

            jButton7.setAction(actionMap.get("editFuncionario")); // NOI18N
            jButton7.setIcon(resourceMap.getIcon("jButton7.icon")); // NOI18N
            jButton7.setText(resourceMap.getString("jButton7.text")); // NOI18N
            jButton7.setToolTipText(resourceMap.getString("jButton7.toolTipText")); // NOI18N
            jButton7.setName("jButton7"); // NOI18N

            jButton8.setAction(actionMap.get("nuevoFuncionario")); // NOI18N
            jButton8.setIcon(resourceMap.getIcon("jButton8.icon")); // NOI18N
            jButton8.setText(resourceMap.getString("jButton8.text")); // NOI18N
            jButton8.setToolTipText(resourceMap.getString("jButton8.toolTipText")); // NOI18N
            jButton8.setName("jButton8"); // NOI18N

            jLabel2.setFont(resourceMap.getFont("jLabel2.font")); // NOI18N
            jLabel2.setText(resourceMap.getString("jLabel2.text")); // NOI18N
            jLabel2.setName("jLabel2"); // NOI18N

            jLabel3.setFont(resourceMap.getFont("jLabel3.font")); // NOI18N
            jLabel3.setText(resourceMap.getString("jLabel3.text")); // NOI18N
            jLabel3.setName("jLabel3"); // NOI18N

            jLabel4.setFont(resourceMap.getFont("jLabel4.font")); // NOI18N
            jLabel4.setText(resourceMap.getString("jLabel4.text")); // NOI18N
            jLabel4.setName("jLabel4"); // NOI18N

            jLabel5.setFont(resourceMap.getFont("jLabel5.font")); // NOI18N
            jLabel5.setText(resourceMap.getString("jLabel5.text")); // NOI18N
            jLabel5.setName("jLabel5"); // NOI18N

            javax.swing.GroupLayout mainPanelLayout = new javax.swing.GroupLayout(mainPanel);
            mainPanel.setLayout(mainPanelLayout);
            mainPanelLayout.setHorizontalGroup(
                mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(mainPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mainPanelLayout.createSequentialGroup()
                            .addGap(313, 313, 313)
                            .addComponent(jButton8, javax.swing.GroupLayout.PREFERRED_SIZE, 46, Short.MAX_VALUE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(jButton7, javax.swing.GroupLayout.PREFERRED_SIZE, 44, Short.MAX_VALUE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 44, Short.MAX_VALUE)
                            .addGap(18, 18, 18)
                            .addComponent(refreshButton, javax.swing.GroupLayout.PREFERRED_SIZE, 75, Short.MAX_VALUE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(saveButton, javax.swing.GroupLayout.PREFERRED_SIZE, 68, Short.MAX_VALUE))
                        .addGroup(mainPanelLayout.createSequentialGroup()
                            .addComponent(jLabel2)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 260, Short.MAX_VALUE)
                            .addComponent(jLabel1)
                            .addGap(18, 18, 18)
                            .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(masterScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 626, Short.MAX_VALUE)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mainPanelLayout.createSequentialGroup()
                            .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(mainPanelLayout.createSequentialGroup()
                                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addGap(132, 132, 132))
                                .addGroup(mainPanelLayout.createSequentialGroup()
                                    .addComponent(newDetailButton, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(deleteDetailButton, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(detailScrollPane, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 252, Short.MAX_VALUE))
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mainPanelLayout.createSequentialGroup()
                                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mainPanelLayout.createSequentialGroup()
                                    .addComponent(jLabel4)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 95, Short.MAX_VALUE)
                                    .addComponent(newButton, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(deleteButton, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 362, Short.MAX_VALUE)))
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 626, Short.MAX_VALUE)
                        .addComponent(jLabel5))
                    .addContainerGap())
            );
            mainPanelLayout.setVerticalGroup(
                mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(mainPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(jLabel2)
                        .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextField1)
                            .addComponent(jLabel1)))
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addComponent(masterScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 171, Short.MAX_VALUE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel4))
                                .addComponent(deleteButton))
                            .addComponent(jButton1))
                        .addComponent(newButton))
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(detailScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 135, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 135, Short.MAX_VALUE))
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(jButton2)
                        .addComponent(newDetailButton)
                        .addComponent(deleteDetailButton)
                        .addComponent(jButton4)
                        .addComponent(jButton5)
                        .addComponent(jButton3))
                    .addGap(12, 12, 12)
                    .addComponent(jLabel5)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE)
                    .addGap(3, 3, 3)
                    .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton6)
                            .addComponent(jButton7)
                            .addComponent(jButton8))
                        .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(saveButton)
                            .addComponent(refreshButton)))
                    .addGap(18, 18, 18))
            );

            menuBar.setName("menuBar"); // NOI18N

            fileMenu.setAction(actionMap.get("login")); // NOI18N
            fileMenu.setText(resourceMap.getString("fileMenu.text")); // NOI18N
            fileMenu.setName("fileMenu"); // NOI18N

            jSeparator1.setName("jSeparator1"); // NOI18N
            fileMenu.add(jSeparator1);

            saveMenuItem.setAction(actionMap.get("save")); // NOI18N
            saveMenuItem.setText(resourceMap.getString("saveMenuItem.text")); // NOI18N
            saveMenuItem.setName("saveMenuItem"); // NOI18N
            fileMenu.add(saveMenuItem);

            refreshMenuItem.setAction(actionMap.get("refresh")); // NOI18N
            refreshMenuItem.setText(resourceMap.getString("refreshMenuItem.text")); // NOI18N
            refreshMenuItem.setName("refreshMenuItem"); // NOI18N
            fileMenu.add(refreshMenuItem);

            jSeparator2.setName("jSeparator2"); // NOI18N
            fileMenu.add(jSeparator2);

            jSeparator4.setName("jSeparator4"); // NOI18N
            fileMenu.add(jSeparator4);

            exitMenuItem.setAction(actionMap.get("quit")); // NOI18N
            exitMenuItem.setText(resourceMap.getString("exitMenuItem.text")); // NOI18N
            exitMenuItem.setName("exitMenuItem"); // NOI18N
            fileMenu.add(exitMenuItem);

            menuBar.add(fileMenu);

            jMenu1.setMnemonic('C');
            jMenu1.setText(resourceMap.getString("jMenu1.text")); // NOI18N
            jMenu1.setName("jMenu1"); // NOI18N
            jMenu1.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    editaTipoCargo(evt);
                }
            });

            jMenuItem1.setMnemonic('S');
            jMenuItem1.setText(resourceMap.getString("jMenuItem1.text")); // NOI18N
            jMenuItem1.setName("jMenuItem1"); // NOI18N
            jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    jMenuItem1ActionPerformed(evt);
                }
            });
            jMenu1.add(jMenuItem1);

            jMenuItem4.setMnemonic('U');
            jMenuItem4.setText(resourceMap.getString("jMenuItem4.text")); // NOI18N
            jMenuItem4.setName("jMenuItem4"); // NOI18N
            jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    editarUsos(evt);
                }
            });
            jMenu1.add(jMenuItem4);

            jmiCargos.setMnemonic('C');
            jmiCargos.setText(resourceMap.getString("jmiCargos.text")); // NOI18N
            jmiCargos.setName("jmiCargos"); // NOI18N
            jmiCargos.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    jmiCargosActionPerformed(evt);
                }
            });
            jMenu1.add(jmiCargos);

            jMenuItem6.setText(resourceMap.getString("jMenuItem6.text")); // NOI18N
            jMenuItem6.setName("jMenuItem6"); // NOI18N
            jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    editarTipoCargo(evt);
                }
            });
            jMenu1.add(jMenuItem6);

            jMenuItem3.setMnemonic('T');
            jMenuItem3.setText(resourceMap.getString("jMenuItem3.text")); // NOI18N
            jMenuItem3.setName("jMenuItem3"); // NOI18N
            jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    editarTipos(evt);
                }
            });
            jMenu1.add(jMenuItem3);

            jMenuItem5.setText(resourceMap.getString("jMenuItem5.text")); // NOI18N
            jMenuItem5.setName("jMenuItem5"); // NOI18N
            jMenuItem5.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    editarZonas(evt);
                }
            });
            jMenu1.add(jMenuItem5);

            jSeparator3.setName("jSeparator3"); // NOI18N
            jMenu1.add(jSeparator3);

            menuBar.add(jMenu1);

            helpMenu.setMnemonic('Y');
            helpMenu.setText(resourceMap.getString("helpMenu.text")); // NOI18N
            helpMenu.setName("helpMenu"); // NOI18N

            aboutMenuItem.setAction(actionMap.get("showAboutBox")); // NOI18N
            aboutMenuItem.setText(resourceMap.getString("aboutMenuItem.text")); // NOI18N
            aboutMenuItem.setName("aboutMenuItem"); // NOI18N
            helpMenu.add(aboutMenuItem);

            menuBar.add(helpMenu);

            statusPanel.setName("statusPanel"); // NOI18N

            statusPanelSeparator.setName("statusPanelSeparator"); // NOI18N

            statusMessageLabel.setName("statusMessageLabel"); // NOI18N

            statusAnimationLabel.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
            statusAnimationLabel.setName("statusAnimationLabel"); // NOI18N

            progressBar.setName("progressBar"); // NOI18N

            javax.swing.GroupLayout statusPanelLayout = new javax.swing.GroupLayout(statusPanel);
            statusPanel.setLayout(statusPanelLayout);
            statusPanelLayout.setHorizontalGroup(
                statusPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(statusPanelLayout.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(statusPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(statusPanelLayout.createSequentialGroup()
                            .addComponent(statusPanelSeparator, javax.swing.GroupLayout.DEFAULT_SIZE, 614, Short.MAX_VALUE)
                            .addGap(12, 12, 12))
                        .addGroup(statusPanelLayout.createSequentialGroup()
                            .addComponent(statusMessageLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(271, 271, 271)
                            .addComponent(progressBar, javax.swing.GroupLayout.DEFAULT_SIZE, 162, Short.MAX_VALUE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(statusAnimationLabel, javax.swing.GroupLayout.DEFAULT_SIZE, 20, Short.MAX_VALUE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                    .addGap(12, 12, 12))
            );
            statusPanelLayout.setVerticalGroup(
                statusPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(statusPanelLayout.createSequentialGroup()
                    .addComponent(statusPanelSeparator, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                    .addGroup(statusPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addGroup(statusPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(progressBar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(statusAnimationLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(statusMessageLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            );

        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Error en los parametros de ingreso",
                "Alerta!",JOptionPane.WARNING_MESSAGE);
        }

        rowSorterToStringConverter1.setTable(tablaEdificios);

        setComponent(mainPanel);
        setMenuBar(menuBar);
        setStatusBar(statusPanel);
        addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                formPropertyChange(evt);
            }
        });

        bindingGroup.bind();
    }// </editor-fold>//GEN-END:initComponents

    private void formPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_formPropertyChange
        // TODO add your handling code here:
    }//GEN-LAST:event_formPropertyChange

    private void editaTipoCargo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editaTipoCargo
}//GEN-LAST:event_editaTipoCargo

    private void editarZonas(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editarZonas
        JDZonas zonas = new JDZonas(mainFrame, true);
        zonas.setLocationRelativeTo(mainFrame);
        zonas.setVisible(true);
}//GEN-LAST:event_editarZonas

    private void editarTipos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editarTipos
        JDNewType tipo = new JDNewType((mainFrame), true);
        tipo.setLocationRelativeTo(mainFrame);
        tipo.setVisible(true);
        if (tipo.isConfirmedTipo()) {
            save().run();
        }
}//GEN-LAST:event_editarTipos

    private void editarTipoCargo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editarTipoCargo
        JDNewTipoCargo tipoCargos = new JDNewTipoCargo(mainFrame, true);
        tipoCargos.setLocationRelativeTo(mainFrame);
        tipoCargos.setVisible(true);
}//GEN-LAST:event_editarTipoCargo

    private void jmiCargosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jmiCargosActionPerformed
        JDNewCargo cargo = new JDNewCargo(mainFrame, true);
        cargo.setLocationRelativeTo(mainFrame);
        cargo.setVisible(true);
}//GEN-LAST:event_jmiCargosActionPerformed

    private void editarUsos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editarUsos
        JDNewUsos usos = new JDNewUsos(mainFrame, true);
        usos.setLocationRelativeTo(mainFrame);
        usos.setVisible(true);
        if (usos.isUsosConfirmed()) {
            save().run();
        }
}//GEN-LAST:event_editarUsos

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        JDNewSede sede = new JDNewSede(mainFrame, true);
        sede.setLocationRelativeTo(mainFrame);
        sede.setVisible(true);
}//GEN-LAST:event_jMenuItem1ActionPerformed

    @Action(enabledProperty = "recordSelected")
    public void editEdificio() {
        setSaveNeeded(true);
        int indexEdf = tablaEdificios.getSelectedRow();
        JDNewBuilding ce = new JDNewBuilding(mainFrame, true);
        ce.setCurrentRecord(listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf)));
        ce.setLocationRelativeTo(mainFrame);
        ce.setVisible(true);
        if (ce.isEdificioConfirmed()) {
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
        }
    }

    @Action(enabledProperty = "detailRecordSelected")
    public void editPiso() {
        setSaveNeeded(true);
        int indexEdf = tablaEdificios.getSelectedRow();
        mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
        Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
        List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
        JDNewFloor nf = new JDNewFloor(mainFrame, true);
        int indexPiso = tablaPisos.getSelectedRow();
        nf.setCurrentRecord(ledf.get(tablaPisos.convertRowIndexToModel(indexPiso)));
        nf.setLocationRelativeTo(mainFrame);
        nf.setVisible(true);
        if (nf.isPisoConfirmed()) {
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
        }
    }

    @Action(enabledProperty = "espacioRecordSelected")
    public void editEspacio() {
        setSaveNeeded(true);
        int indexEdf = tablaEdificios.getSelectedRow();
        mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
        Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
        List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
        int indexPiso = tablaPisos.getSelectedRow();
        mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(indexPiso));
        Collection<EdificioEspacio> es = E.getEdificioEspacioCollection();
        List<EdificioEspacio> lstEsp = new ArrayList<EdificioEspacio>((java.util.Collection<? extends mapaadmin.dao.EdificioEspacio>) es);
        JDNewSpace nf = new JDNewSpace((mainFrame), true);
        int indexEsp = tablaEspacios.getSelectedRow();
        nf.setCurrentRecord(lstEsp.get(tablaEspacios.convertRowIndexToModel(indexEsp)));
        nf.setLocationRelativeTo(mainFrame);
        nf.setVisible(true);
        if (nf.isEspacioConfirmed()) {
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
            tablaEspacios.clearSelection();
            tablaEspacios.setRowSelectionInterval(indexEsp, indexEsp);
        }
    }

    @Action(enabledProperty = "funcionarioRecordSelected")
    public void editFuncionario() {
        setSaveNeeded(true);
        int indexEdf = tablaEdificios.getSelectedRow();
        mapaadmin.dao.EdificioInfo edfInfo = listaEdificios.get(tablaEdificios.convertRowIndexToModel(indexEdf));
        Collection<mapaadmin.dao.EdificioPiso> edfPiso = edfInfo.getEdificioPisoCollection();
        List<mapaadmin.dao.EdificioPiso> ledf = (List<mapaadmin.dao.EdificioPiso>) edfPiso;
        int indexPiso = tablaPisos.getSelectedRow();
        mapaadmin.dao.EdificioPiso E = ledf.get(tablaPisos.convertRowIndexToModel(indexPiso));
        Collection<EdificioEspacio> es = E.getEdificioEspacioCollection();
        List<EdificioEspacio> ledfesp = (List<EdificioEspacio>) es;
        int indexEspacio = tablaEspacios.getSelectedRow();
        EdificioEspacio EE = ledfesp.get(tablaEspacios.convertRowIndexToModel(indexEspacio));
        List<mapaadmin.dao.Funcionario> ee = EE.getFuncionarioEspacioCollection();
        JDNewFuncionario ef = new JDNewFuncionario(mainFrame, true);
        int indexFun = tablaFuncionarios.getSelectedRow();
        ef.setCurrentRecord(ee.get(tablaFuncionarios.convertRowIndexToModel(indexFun)));
        ef.setLocationRelativeTo(mainFrame);
        ef.setVisible(true);
        if (ef.isFuncionarioConfirmed()) {
            save().run();
        } else {
            refresh().run();
            tablaEdificios.clearSelection();
            tablaEdificios.setRowSelectionInterval(indexEdf, indexEdf);
            tablaPisos.clearSelection();
            tablaPisos.setRowSelectionInterval(indexPiso, indexPiso);
            tablaEspacios.clearSelection();
            tablaEspacios.setRowSelectionInterval(indexEspacio, indexEspacio);
            tablaFuncionarios.clearSelection();
            tablaFuncionarios.setRowSelectionInterval(indexFun, indexFun);
        }
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton deleteButton;
    private javax.swing.JButton deleteDetailButton;
    private javax.swing.JScrollPane detailScrollPane;
    private java.util.List<mapaadmin.dao.EdificioEspacio> edificioEspacioList;
    private javax.persistence.Query edificioEspacioQuery;
    private java.util.List<mapaadmin.dao.EdificioPiso> edificioPisoList;
    private javax.persistence.Query edificioPisoQuery;
    private javax.persistence.EntityManager entityManager;
    private java.util.List<mapaadmin.dao.Funcionario> funcionarioList;
    private javax.persistence.Query funcionarioQuery;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JMenuItem jmiCargos;
    private java.util.List<mapaadmin.dao.EdificioInfo> listaEdificios;
    private javax.swing.JPanel mainPanel;
    private javax.swing.JScrollPane masterScrollPane;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JButton newButton;
    private javax.swing.JButton newDetailButton;
    private javax.swing.JProgressBar progressBar;
    private javax.persistence.Query query;
    private javax.swing.JButton refreshButton;
    private mapaadmin.RowSorterToStringConverter rowSorterToStringConverter1;
    private javax.swing.JButton saveButton;
    private javax.swing.JLabel statusAnimationLabel;
    private javax.swing.JLabel statusMessageLabel;
    private javax.swing.JPanel statusPanel;
    private javax.swing.JTable tablaEdificios;
    private javax.swing.JTable tablaEspacios;
    private javax.swing.JTable tablaFuncionarios;
    private javax.swing.JTable tablaPisos;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
    private final Timer messageTimer;
    private final Timer busyIconTimer;
    private final Icon idleIcon;
    private final Icon[] busyIcons = new Icon[15];
    private int busyIconIndex = 0;
    private JDialog aboutBox;
    private boolean saveNeeded;
}
