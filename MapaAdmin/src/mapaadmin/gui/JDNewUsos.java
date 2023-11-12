/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewUsos.java
 *
 * Created on 1/05/2009, 04:18:48 PM
 */
package mapaadmin.gui;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.RollbackException;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import mapaadmin.MapaAdminApp;
import mapaadmin.dao.TipoUso;
import org.jdesktop.application.Action;
import org.jdesktop.application.Task;
import org.jdesktop.beansbinding.AbstractBindingListener;
import org.jdesktop.beansbinding.Binding;
import org.jdesktop.beansbinding.PropertyStateEvent;

/**
 *
 * @author David Acosta
 */
public class JDNewUsos extends javax.swing.JDialog {
    private static final long serialVersionUID = 2917301461448795155L;

    
    /** Creates new form JDNewUsos */
    public JDNewUsos(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        tblUsos.getSelectionModel().addListSelectionListener(
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

    public boolean isRecordSelected() {
        return tblUsos.getSelectedRow() != -1;
    }
    protected boolean usosConfirmed;

    /**
     * Get the value of usosConfirmed
     *
     * @return the value of usosConfirmed
     */
    public boolean isUsosConfirmed() {
        return usosConfirmed;
    }

    /**
     * Set the value of usosConfirmed
     *
     * @param usosConfirmed new value of usosConfirmed
     */
    public void setUsosConfirmed(boolean usosConfirmed) {
        this.usosConfirmed = usosConfirmed;
    }

    @Action
    public void newRecordUso() {
        TipoUso CF = new TipoUso();
        ucentral2PUEntityManager.persist(CF);
        tipoUsoList.add(CF);
        int row = tblUsos.getRowCount() - 1;
        tblUsos.setRowSelectionInterval(row, row);
        tblUsos.scrollRectToVisible(tblUsos.getCellRect(row, 0, true));
        setSaveNeeded(true);
    }

    @Action(enabledProperty = "recordSelected")
    public void deleteRecordUso() {
        Object[] options = {"OK", "Cancel"};
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            int[] selected = tblUsos.getSelectedRows();
            List<TipoUso> toRemove = new ArrayList<TipoUso>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                TipoUso cf = tipoUsoList.get(tblUsos.convertRowIndexToModel(selected[idx]));
                toRemove.add(cf);
                ucentral2PUEntityManager.remove(cf);
            }
            tipoUsoList.removeAll(toRemove);
            setSaveNeeded(true);
            save().run();
        } else {
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
                List<TipoUso> merged = new ArrayList<TipoUso>(tipoUsoList.size());
                for (TipoUso CF : tipoUsoList) {
                    merged.add(ucentral2PUEntityManager.merge(CF));
                }
                tipoUsoList.clear();
                tipoUsoList.addAll(merged);
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
                java.util.Collection data = tipoUsoQuery.getResultList();
                for (Object entity : data) {
                    ucentral2PUEntityManager.refresh(entity);
                }
                tipoUsoList.clear();
                tipoUsoList.addAll(data);
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
        tipoUsoQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT t FROM TipoUso t");
        tipoUsoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(tipoUsoQuery.getResultList());
        jScrollPane1 = new javax.swing.JScrollPane();
        tblUsos = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jtfNombre = new javax.swing.JTextField();
        btnCancelar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        btnAgregar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewUsos.class);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setLocationByPlatform(true);
        setName("Form"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        tblUsos.setName("tblUsos"); // NOI18N
        tblUsos.getTableHeader().setReorderingAllowed(false);

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoUsoList, tblUsos);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomTipoUso}"));
        columnBinding.setColumnName("Nom Tipo Uso");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane1.setViewportView(tblUsos);
        tblUsos.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tblUsos.columnModel.title0")); // NOI18N

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jtfNombre.setName("jtfNombre"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblUsos, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.nomTipoUso}"), jtfNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        btnCancelar.setText(resourceMap.getString("btnCancelar.text")); // NOI18N
        btnCancelar.setName("btnCancelar"); // NOI18N
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarCambios(evt);
            }
        });

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(JDNewUsos.class, this);
        btnGuardar.setAction(actionMap.get("save")); // NOI18N
        btnGuardar.setText(resourceMap.getString("btnGuardar.text")); // NOI18N
        btnGuardar.setName("btnGuardar"); // NOI18N

        btnBorrar.setAction(actionMap.get("deleteRecordUso")); // NOI18N
        btnBorrar.setIcon(resourceMap.getIcon("btnBorrar.icon")); // NOI18N
        btnBorrar.setText(resourceMap.getString("btnBorrar.text")); // NOI18N
        btnBorrar.setToolTipText(resourceMap.getString("btnBorrar.toolTipText")); // NOI18N
        btnBorrar.setName("btnBorrar"); // NOI18N

        btnAgregar.setAction(actionMap.get("newRecordUso")); // NOI18N
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
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 278, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jtfNombre, javax.swing.GroupLayout.DEFAULT_SIZE, 233, Short.MAX_VALUE))
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
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 145, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jtfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancelar)
                    .addComponent(btnGuardar)
                    .addComponent(btnBorrar)
                    .addComponent(btnAgregar))
                .addContainerGap())
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelarCambios(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarCambios
        setUsosConfirmed(true);
        setVisible(false);
    }//GEN-LAST:event_cancelarCambios

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jtfNombre;
    private javax.swing.JTable tblUsos;
    private java.util.List<mapaadmin.dao.TipoUso> tipoUsoList;
    private javax.persistence.Query tipoUsoQuery;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
