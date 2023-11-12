/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewType.java
 *
 * Created on 1/05/2009, 08:30:04 AM
 */
package mapaadmin.gui;

import org.jdesktop.application.Action;
import org.jdesktop.application.Task;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.RollbackException;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import mapaadmin.dao.TipoEspacio;
import org.jdesktop.beansbinding.AbstractBindingListener;
import org.jdesktop.beansbinding.Binding;
import org.jdesktop.beansbinding.PropertyStateEvent;

/**
 *
 * @author David Acosta
 */
public class JDNewType extends javax.swing.JDialog {
    private static final long serialVersionUID = 931903497877728976L;

    
    /** Creates new form JDNewType */
    public JDNewType(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        tblTipoEspacio.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("recordSelected", !isRecordSelected(), isRecordSelected());
                    }
                });

        //tracking changes to save
        bindingGroup.addBindingListener(new AbstractBindingListener() {

            @Override
            public void targetChanged(Binding binding, PropertyStateEvent event) {
                //save action observes saveNeeded property
                setSaveNeeded(true);
            }
        });

        ucentral2PUEntityManager.getTransaction().begin();
    }

    public boolean isRecordSelected() {
        return tblTipoEspacio.getSelectedRow() != -1;
    }
    protected boolean saveNeeded;

    /**
     * Get the value of saveNeeded
     *
     * @return the value of saveNeeded
     */
    public boolean isSaveNeeded() {
        return saveNeeded;
    }

    /**
     * Set the value of saveNeeded
     *
     * @param saveNeeded new value of saveNeeded
     */
    public void setSaveNeeded(boolean saveNeeded) {
        if (saveNeeded != this.saveNeeded) {
            this.saveNeeded = saveNeeded;
            firePropertyChange("saveNeeded", !saveNeeded, saveNeeded);
        }
    }
    protected boolean confirmedTipo;

    /**
     * Get the value of confirmedTipo
     *
     * @return the value of confirmedTipo
     */
    public boolean isConfirmedTipo() {
        return confirmedTipo;
    }

    /**
     * Set the value of confirmedTipo
     *
     * @param confirmedTipo new value of confirmedTipo
     */
    public void setConfirmedTipo(boolean confirmedTipo) {
        this.confirmedTipo = confirmedTipo;
    }

    @Action
    public void newRecordTipo() {
        TipoEspacio TE = new TipoEspacio();
        ucentral2PUEntityManager.persist(TE);
        tipoEspacioList.add(TE);
        int row = tblTipoEspacio.getRowCount() - 1;
        tblTipoEspacio.setRowSelectionInterval(row, row);
        tblTipoEspacio.scrollRectToVisible(tblTipoEspacio.getCellRect(row, 0, true));
        setSaveNeeded(true);
    }

    @Action(enabledProperty = "recordSelected")
    public void deleteRecordTipo() {
        Object[] options = {"OK", "Cancel"};
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            int[] selected = tblTipoEspacio.getSelectedRows();
            List<TipoEspacio> toRemove = new ArrayList<TipoEspacio>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                TipoEspacio t = tipoEspacioList.get(tblTipoEspacio.convertRowIndexToModel(selected[idx]));
                toRemove.add(t);
                ucentral2PUEntityManager.remove(t);
            }
            tipoEspacioList.removeAll(toRemove);
            save().run();
        }
    }

    @Action(enabledProperty = "saveNeeded")
    public Task save() {
        return new SaveTask(mapaadmin.MapaAdminApp.getApplication());
    }

    private class SaveTask extends Task {

        SaveTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @Override
        protected Void doInBackground() {
            try {
                ucentral2PUEntityManager.getTransaction().commit();
                ucentral2PUEntityManager.getTransaction().begin();
            } catch (RollbackException rex) {
                rex.printStackTrace();
                ucentral2PUEntityManager.getTransaction().begin();
                List<TipoEspacio> merged = new ArrayList<TipoEspacio>(tipoEspacioList.size());
                for (TipoEspacio E : tipoEspacioList) {
                    merged.add(ucentral2PUEntityManager.merge(E));
                }
                tipoEspacioList.clear();
                tipoEspacioList.addAll(merged);
            }
            return null;
        }

        @Override
        protected void finished() {
            setSaveNeeded(false);
        }
    }

    @Action
    public Task refresh() {
        return new RefreshTask(mapaadmin.MapaAdminApp.getApplication());
    }

    private class RefreshTask extends Task {

        RefreshTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @SuppressWarnings("unchecked")
        @Override
        protected Void doInBackground() {
            try {
                setProgress(0, 0, 4);
                setMessage("Retrasando los cambios actuales...");
                setProgress(1, 0, 4);
                ucentral2PUEntityManager.getTransaction().rollback();
                //Thread.sleep(1000L); // remove for real app
                setProgress(2, 0, 4);

                setMessage("Iniciando nueva transaccion...");
                ucentral2PUEntityManager.getTransaction().begin();
                //Thread.sleep(500L); // remove for real app
                setProgress(3, 0, 4);

                setMessage("Obtención de nuevos datos...");
                java.util.Collection data = tipoEspacioQuery.getResultList();
                for (Object entity : data) {
                    ucentral2PUEntityManager.refresh(entity);
                }
                //Thread.sleep(1300L); // remove for real app
                setProgress(4, 0, 4);

                Thread.sleep(150L); // remove for real app
                tipoEspacioList.clear();
                tipoEspacioList.addAll(data);
            } catch (InterruptedException ignore) {
            }
            return null;
        }

        @Override
        protected void finished() {
            setMessage("Hecho.");
            setSaveNeeded(false);
        }
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

        ucentral2PUEntityManager = java.beans.Beans.isDesignTime() ? null : javax.persistence.Persistence.createEntityManagerFactory("ucentral2PU").createEntityManager();
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewType.class);
        tipoEspacioQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery(resourceMap.getString("tipoEspacioQuery.query")); // NOI18N
        tipoEspacioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(tipoEspacioQuery.getResultList());
        jScrollPane1 = new javax.swing.JScrollPane();
        tblTipoEspacio = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jtfNombre = new javax.swing.JTextField();
        bntGuardar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        btnAgregar = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setLocationByPlatform(true);
        setName("Form"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        tblTipoEspacio.setName("tblTipoEspacio"); // NOI18N
        tblTipoEspacio.getTableHeader().setReorderingAllowed(false);

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoEspacioList, tblTipoEspacio);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomTipoEspacio}"));
        columnBinding.setColumnName("Nom Tipo Espacio");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane1.setViewportView(tblTipoEspacio);
        tblTipoEspacio.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tblTipoEspacio.columnModel.title0")); // NOI18N

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jtfNombre.setName("jtfNombre"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblTipoEspacio, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.nomTipoEspacio}"), jtfNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(JDNewType.class, this);
        bntGuardar.setAction(actionMap.get("save")); // NOI18N
        bntGuardar.setText(resourceMap.getString("bntGuardar.text")); // NOI18N
        bntGuardar.setName("bntGuardar"); // NOI18N

        btnBorrar.setAction(actionMap.get("deleteRecordTipo")); // NOI18N
        btnBorrar.setIcon(resourceMap.getIcon("btnBorrar.icon")); // NOI18N
        btnBorrar.setText(resourceMap.getString("btnBorrar.text")); // NOI18N
        btnBorrar.setToolTipText(resourceMap.getString("btnBorrar.toolTipText")); // NOI18N
        btnBorrar.setName("btnBorrar"); // NOI18N

        btnAgregar.setAction(actionMap.get("newRecordTipo")); // NOI18N
        btnAgregar.setIcon(resourceMap.getIcon("btnAgregar.icon")); // NOI18N
        btnAgregar.setText(resourceMap.getString("btnAgregar.text")); // NOI18N
        btnAgregar.setToolTipText(resourceMap.getString("btnAgregar.toolTipText")); // NOI18N
        btnAgregar.setName("btnAgregar"); // NOI18N

        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarTipo(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 347, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jtfNombre, javax.swing.GroupLayout.DEFAULT_SIZE, 302, Short.MAX_VALUE))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(92, 92, 92)
                        .addComponent(btnAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBorrar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE)
                        .addComponent(bntGuardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton1)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 137, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jtfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnBorrar)
                            .addComponent(btnAgregar))
                        .addGap(12, 12, 12))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton1)
                            .addComponent(bntGuardar))
                        .addContainerGap())))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelarTipo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarTipo
        setVisible(false);
    }//GEN-LAST:event_cancelarTipo

    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bntGuardar;
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jtfNombre;
    private javax.swing.JTable tblTipoEspacio;
    private java.util.List<mapaadmin.dao.TipoEspacio> tipoEspacioList;
    private javax.persistence.Query tipoEspacioQuery;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
