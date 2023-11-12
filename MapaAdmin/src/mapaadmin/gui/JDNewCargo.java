/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewCargo.java
 *
 * Created on 26/04/2009, 07:55:13 PM
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
public class JDNewCargo extends javax.swing.JDialog {
    private static final long serialVersionUID = -8551497056675790867L;

   
    /** Creates new form JDNewCargo */
    public JDNewCargo(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        tblCargo.getSelectionModel().addListSelectionListener(
                new ListSelectionListener() {

            @Override
                    public void valueChanged(ListSelectionEvent e) {
                        firePropertyChange("recordCargoSelected", !isRecordCargoSelected(), isRecordCargoSelected());
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

        //have a transaction started
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

    public boolean isRecordCargoSelected() {
        return tblCargo.getSelectedRow() != -1;
    }
    protected boolean cargoConfirmed;

    /**
     * Get the value of cargoConfirmed
     *
     * @return the value of cargoConfirmed
     */
    public boolean isCargoConfirmed() {
        return cargoConfirmed;
    }

    /**
     * Set the value of cargoConfirmed
     *
     * @param cargoConfirmed new value of cargoConfirmed
     */
    public void setCargoConfirmed(boolean cargoConfirmed) {
        this.cargoConfirmed = cargoConfirmed;
    }

    @Action
    public void newRecordCargo() {
        mapaadmin.dao.CargoFuncionario CF = new mapaadmin.dao.CargoFuncionario();
        entityManager.persist(CF);
        cargoFuncionarioList.add(CF);
        int row = tblCargo.getRowCount() - 1;
        tblCargo.setRowSelectionInterval(row, row);
        tblCargo.scrollRectToVisible(tblCargo.getCellRect(row, 0, true));
        setSaveNeeded(true);
    }

    @Action(enabledProperty = "recordCargoSelected")
    public void deleteRecordCargo() {
        Object[] options = {"OK", "Cancel"};
        int n = JOptionPane.showConfirmDialog(null, "Borrar el registro permanentemente?", "Alerta!",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null);
        if (n == JOptionPane.YES_OPTION) {
            int[] selected = tblCargo.getSelectedRows();
            List<mapaadmin.dao.CargoFuncionario> toRemove = new ArrayList<mapaadmin.dao.CargoFuncionario>(selected.length);
            for (int idx = 0; idx < selected.length; idx++) {
                mapaadmin.dao.CargoFuncionario cf = cargoFuncionarioList.get(tblCargo.convertRowIndexToModel(selected[idx]));
                toRemove.add(cf);
                entityManager.remove(cf);
            }
            cargoFuncionarioList.removeAll(toRemove);
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
                entityManager.getTransaction().commit();
                entityManager.getTransaction().begin();
            } catch (RollbackException rex) {
                rex.printStackTrace();
                entityManager.getTransaction().begin();
                List<mapaadmin.dao.CargoFuncionario> merged = new ArrayList<mapaadmin.dao.CargoFuncionario>(cargoFuncionarioList.size());
                for (mapaadmin.dao.CargoFuncionario CF : cargoFuncionarioList) {
                    merged.add(entityManager.merge(CF));
                }
                cargoFuncionarioList.clear();
                cargoFuncionarioList.addAll(merged);
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
                entityManager.getTransaction().rollback();
                entityManager.getTransaction().begin();
                java.util.Collection data = cargoFuncionarioQuery.getResultList();
                for (Object entity : data) {
                    entityManager.refresh(entity);
                }
                cargoFuncionarioList.clear();
                cargoFuncionarioList.addAll(data);
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

        entityManager = java.beans.Beans.isDesignTime() ? null : javax.persistence.Persistence.createEntityManagerFactory("ucentral2PU").createEntityManager();
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewCargo.class);
        cargoFuncionarioQuery = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery(resourceMap.getString("cargoFuncionarioQuery.query")); // NOI18N
        cargoFuncionarioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(cargoFuncionarioQuery.getResultList());
        tipoCargoQuery = java.beans.Beans.isDesignTime() ? null : entityManager.createQuery(resourceMap.getString("tipoCargoQuery.query")); // NOI18N
        tipoCargoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : tipoCargoQuery.getResultList();
        tipoCargoListCellRenderer1 = new mapaadmin.tools.TipoCargoListCellRenderer();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCargo = new javax.swing.JTable();
        btnAgregar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jtfNombre = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        cbxtipoCargo = new javax.swing.JComboBox();

        tipoCargoListCellRenderer1.setText(resourceMap.getString("tipoCargoListCellRenderer1.text")); // NOI18N
        tipoCargoListCellRenderer1.setName("tipoCargoListCellRenderer1"); // NOI18N

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setBackground(resourceMap.getColor("Form.background")); // NOI18N
        setLocationByPlatform(true);
        setName("Form"); // NOI18N
        setResizable(false);

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        tblCargo.setName("tblCargo"); // NOI18N
        tblCargo.getTableHeader().setReorderingAllowed(false);

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, cargoFuncionarioList, tblCargo);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomCargo}"));
        columnBinding.setColumnName("Nom Cargo");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${tipoCargo.nomTipocargo}"));
        columnBinding.setColumnName("Tipo Cargo.nom Tipocargo");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane1.setViewportView(tblCargo);
        tblCargo.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tblCargo.columnModel.title0")); // NOI18N
        tblCargo.getColumnModel().getColumn(1).setHeaderValue(resourceMap.getString("tblCargo.columnModel.title1")); // NOI18N

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(JDNewCargo.class, this);
        btnAgregar.setAction(actionMap.get("newRecordCargo")); // NOI18N
        btnAgregar.setIcon(resourceMap.getIcon("btnAgregar.icon")); // NOI18N
        btnAgregar.setText(resourceMap.getString("btnAgregar.text")); // NOI18N
        btnAgregar.setToolTipText(resourceMap.getString("btnAgregar.toolTipText")); // NOI18N
        btnAgregar.setName("btnAgregar"); // NOI18N

        btnBorrar.setAction(actionMap.get("deleteRecordCargo")); // NOI18N
        btnBorrar.setIcon(resourceMap.getIcon("btnBorrar.icon")); // NOI18N
        btnBorrar.setText(resourceMap.getString("btnBorrar.text")); // NOI18N
        btnBorrar.setToolTipText(resourceMap.getString("btnBorrar.toolTipText")); // NOI18N
        btnBorrar.setName("btnBorrar"); // NOI18N

        btnGuardar.setAction(actionMap.get("save")); // NOI18N
        btnGuardar.setText(resourceMap.getString("btnGuardar.text")); // NOI18N
        btnGuardar.setName("btnGuardar"); // NOI18N

        jLabel2.setText(resourceMap.getString("jLabel2.text")); // NOI18N
        jLabel2.setName("jLabel2"); // NOI18N

        jtfNombre.setName("jtfNombre"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblCargo, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.nomCargo}"), jtfNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarCargo(evt);
            }
        });

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        cbxtipoCargo.setName("cbxtipoCargo"); // NOI18N
        cbxtipoCargo.setRenderer(tipoCargoListCellRenderer1);

        org.jdesktop.swingbinding.JComboBoxBinding jComboBoxBinding = org.jdesktop.swingbinding.SwingBindings.createJComboBoxBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoCargoList, cbxtipoCargo);
        bindingGroup.addBinding(jComboBoxBinding);
        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblCargo, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.tipoCargo}"), cbxtipoCargo, org.jdesktop.beansbinding.BeanProperty.create("selectedItem"));
        bindingGroup.addBinding(binding);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 356, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(4, 4, 4)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(btnAgregar)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel1)
                                        .addGap(46, 46, 46)))))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(btnBorrar, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(59, 59, 59)
                                .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 31, Short.MAX_VALUE)
                                .addComponent(jButton1))
                            .addComponent(jtfNombre, javax.swing.GroupLayout.DEFAULT_SIZE, 276, Short.MAX_VALUE)
                            .addComponent(cbxtipoCargo, 0, 276, Short.MAX_VALUE))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 128, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jtfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1)
                    .addComponent(cbxtipoCargo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(btnAgregar)
                        .addComponent(btnBorrar))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnGuardar)
                        .addComponent(jButton1)))
                .addContainerGap())
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelarCargo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarCargo
        setVisible(false);
    }//GEN-LAST:event_cancelarCargo

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton btnGuardar;
    private java.util.List<mapaadmin.dao.CargoFuncionario> cargoFuncionarioList;
    private javax.persistence.Query cargoFuncionarioQuery;
    private javax.swing.JComboBox cbxtipoCargo;
    private javax.persistence.EntityManager entityManager;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jtfNombre;
    private javax.swing.JTable tblCargo;
    private java.util.List<mapaadmin.dao.TipoCargo> tipoCargoList;
    private mapaadmin.tools.TipoCargoListCellRenderer tipoCargoListCellRenderer1;
    private javax.persistence.Query tipoCargoQuery;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
    private boolean saveNeeded;
}
