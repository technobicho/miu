/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewTipoCargo.java
 *
 * Created on 9/06/2009, 11:36:08 AM
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
import mapaadmin.MapaAdminApp;
import org.jdesktop.beansbinding.AbstractBindingListener;
import org.jdesktop.beansbinding.Binding;
import org.jdesktop.beansbinding.PropertyStateEvent;

/**
 *
 * @author David Acosta
 */
public class JDNewTipoCargo extends javax.swing.JDialog {
    private static final long serialVersionUID = -1144680849586960960L;

    
    /** Creates new form JDNewTipoCargo */
    public JDNewTipoCargo(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        tblTipoCargo.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("recordTipoCargoSelected", !isRecordTipoCargoSelected(), isRecordTipoCargoSelected());
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

        //have a trasaction started
        ucentral2PUEntityManager.getTransaction().begin();
    }
    protected boolean saveNeeded;

    /**
     * Get the value of SaveNeeded
     *
     * @return the value of SaveNeeded
     */
    public boolean isSaveNeeded() {
        return saveNeeded;
    }

    /**
     * Set the value of SaveNeeded
     *
     * @param SaveNeeded new value of SaveNeeded
     */
    public void setSaveNeeded(boolean saveNeeded) {
        if (saveNeeded != this.saveNeeded) {
            this.saveNeeded = saveNeeded;
            firePropertyChange("saveNeeded", !saveNeeded, saveNeeded);
        }
    }
    protected boolean recordTipoCargoSelected;

    /**
     * Get the value of recorgTipoCargoSelected
     *
     * @return the value of recorgTipoCargoSelected
     */
    public boolean isRecordTipoCargoSelected() {
        return tblTipoCargo.getSelectedRow()!=-1;
    }

    /**
     * Set the value of recorgTipoCargoSelected
     *
     * @param recorgTipoCargoSelected new value of recorgTipoCargoSelected
     */
    public void setRecordTipoCargoSelected(boolean recordTipoCargoSelected) {
        this.recordTipoCargoSelected = recordTipoCargoSelected;
    }

    @Action
    public void newRecordTipoCargo() {
        mapaadmin.dao.TipoCargo TC = new mapaadmin.dao.TipoCargo();
        ucentral2PUEntityManager.persist(TC);
        tipoCargoList.add(TC);
        int row = tblTipoCargo.getRowCount() - 1;
        tblTipoCargo.setRowSelectionInterval(row, row);
        tblTipoCargo.scrollRectToVisible(tblTipoCargo.getCellRect(row, 0, true));
        setSaveNeeded(true);
    }

    @Action(enabledProperty = "recordTipoCargoSelected")
    public void deleteRecordTipoCargo(){
        int n = JOptionPane.showConfirmDialog(null,"Borrar el registro permanentemente?","Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE,null);
        if(n == JOptionPane.YES_OPTION){
            int[] selected = tblTipoCargo.getSelectedRows();
            List<mapaadmin.dao.TipoCargo> toRemove = new ArrayList<mapaadmin.dao.TipoCargo>(selected.length);
            for(int idx = 0; idx < selected.length; idx++){
                mapaadmin.dao.TipoCargo tc = tipoCargoList.get(tblTipoCargo.convertRowIndexToModel(selected[idx]));
                toRemove.add(tc);
                ucentral2PUEntityManager.remove(tc);
            }
            tipoCargoList.removeAll(toRemove);
            setSaveNeeded(true);
            save().run();
        }else{
            refresh().run();
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
                List<mapaadmin.dao.TipoCargo> merged = new ArrayList<mapaadmin.dao.TipoCargo>(tipoCargoList.size());
                for (mapaadmin.dao.TipoCargo TC : tipoCargoList) {
                    merged.add(ucentral2PUEntityManager.merge(TC));
                }
                tipoCargoList.clear();
                tipoCargoList.addAll(merged);
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
        return new RefreshTask(MapaAdminApp.getApplication());
    }

    private class RefreshTask extends Task {

        RefreshTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @SuppressWarnings("unchecked")
        @Override
        protected Object doInBackground() {
            try {
                ucentral2PUEntityManager.getTransaction().rollback();
                ucentral2PUEntityManager.getTransaction().begin();
                java.util.Collection data = tipoCargoQuery.getResultList();
                for (Object entity : data) {
                    ucentral2PUEntityManager.refresh(entity);
                }
                tipoCargoList.clear();
                tipoCargoList.addAll(data);
            } catch (RollbackException ignore) {
            }
            return null;
        }

        @Override
        protected void finished() {
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
        tipoCargoQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT t FROM TipoCargo t");
        tipoCargoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(tipoCargoQuery.getResultList());
        jScrollPane1 = new javax.swing.JScrollPane();
        tblTipoCargo = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        btnCancelar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        btnAgregar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setName("Form"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        tblTipoCargo.setName("tblTipoCargo"); // NOI18N
        tblTipoCargo.getTableHeader().setReorderingAllowed(false);

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoCargoList, tblTipoCargo);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomTipocargo}"));
        columnBinding.setColumnName("Nom Tipocargo");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane1.setViewportView(tblTipoCargo);
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewTipoCargo.class);
        tblTipoCargo.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tblTipoCargo.columnModel.title0")); // NOI18N

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jTextField1.setName("jTextField1"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblTipoCargo, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.nomTipocargo}"), jTextField1, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        btnCancelar.setText(resourceMap.getString("btnCancelar.text")); // NOI18N
        btnCancelar.setName("btnCancelar"); // NOI18N
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarTipo(evt);
            }
        });

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(JDNewTipoCargo.class, this);
        btnGuardar.setAction(actionMap.get("save")); // NOI18N
        btnGuardar.setText(resourceMap.getString("btnGuardar.text")); // NOI18N
        btnGuardar.setName("btnGuardar"); // NOI18N

        btnBorrar.setAction(actionMap.get("deleteRecordTipoCargo")); // NOI18N
        btnBorrar.setIcon(resourceMap.getIcon("btnBorrar.icon")); // NOI18N
        btnBorrar.setText(resourceMap.getString("btnBorrar.text")); // NOI18N
        btnBorrar.setToolTipText(resourceMap.getString("btnBorrar.toolTipText")); // NOI18N
        btnBorrar.setName("btnBorrar"); // NOI18N

        btnAgregar.setAction(actionMap.get("newRecordTipoCargo")); // NOI18N
        btnAgregar.setIcon(resourceMap.getIcon("btnAgregar.icon")); // NOI18N
        btnAgregar.setText(resourceMap.getString("btnAgregar.text")); // NOI18N
        btnAgregar.setToolTipText(resourceMap.getString("btnAgregar.toolTipText")); // NOI18N
        btnAgregar.setName("btnAgregar"); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 256, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField1, javax.swing.GroupLayout.DEFAULT_SIZE, 211, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(btnAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBorrar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGuardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCancelar)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnCancelar)
                        .addComponent(btnGuardar)
                        .addComponent(btnBorrar))
                    .addComponent(btnAgregar))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelarTipo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarTipo
        setVisible(false);
    }//GEN-LAST:event_cancelarTipo

    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTable tblTipoCargo;
    private java.util.List<mapaadmin.dao.TipoCargo> tipoCargoList;
    private javax.persistence.Query tipoCargoQuery;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
