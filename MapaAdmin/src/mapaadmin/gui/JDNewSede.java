/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewSede.java
 *
 * Created on 21/04/2009, 05:34:10 PM
 */

package mapaadmin.gui;

import org.jdesktop.application.Action;
import org.jdesktop.application.Task;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.RollbackException;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import org.jdesktop.beansbinding.AbstractBindingListener;
import org.jdesktop.beansbinding.Binding;
import org.jdesktop.beansbinding.PropertyStateEvent;

/**
 *
 * @author David Acosta
 */
public class JDNewSede extends javax.swing.JDialog {
    private static final long serialVersionUID = 143630352682582034L;

    
    /** Creates new form JDNewSede */
    public JDNewSede(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();

        tblSede.getSelectionModel().addListSelectionListener(
                new ListSelectionListener(){
            @Override
            public void valueChanged(ListSelectionEvent e){
                firePropertyChange("recordSelected",!isRecordSelected(),isRecordSelected());
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

    public boolean isRecordSelected(){
        return tblSede.getSelectedRow() != -1;
    }

    /**
     * @return the saveNeeded
     */
    public boolean isSaveNeeded() {
        return saveNeeded;
    }

    /**
     * @param saveNeeded the saveNeeded to set
     */
    public void setSaveNeeded(boolean saveNeeded) {
        if (saveNeeded != this.saveNeeded) {
            this.saveNeeded = saveNeeded;
            firePropertyChange("saveNeeded", !saveNeeded, saveNeeded);
        }
    }


    protected boolean confirmedSede;

    /**
     * Get the value of confirmedSede
     *
     * @return the value of confirmedSede
     */
    public boolean isConfirmedSede() {
        return confirmedSede;
    }

    /**
     * Set the value of confirmedSede
     *
     * @param confirmedSede new value of confirmedSede
     */
    public void setConfirmedSede(boolean confirmedSede) {
        this.confirmedSede = confirmedSede;
    }

    @Action
    public void newRecordSede(){
        mapaadmin.dao.SedeInfo SI = new mapaadmin.dao.SedeInfo();
        ucentral2PUEntityManager.persist(SI);
        sedeInfoList.add(SI);
        int row = tblSede.getRowCount() - 1;
        tblSede.setRowSelectionInterval(row,row);
        tblSede.scrollRectToVisible(tblSede.getCellRect(row, 0, true));
        setSaveNeeded(true);
    }

    @Action(enabledProperty = "recordSelected")
    public void deleteRecordSede(){
        int[] selected = tblSede.getSelectedRows();
        List<mapaadmin.dao.SedeInfo> toRemove = new ArrayList<mapaadmin.dao.SedeInfo>(selected.length);
        for(int idx = 0;idx < selected.length;idx++){
            mapaadmin.dao.SedeInfo c = sedeInfoList.get(tblSede.convertRowIndexToModel(selected[idx]));
            toRemove.add(c);
            ucentral2PUEntityManager.remove(c);
        }
        sedeInfoList.removeAll(toRemove);
        //save().run();
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
                List<mapaadmin.dao.SedeInfo> merged = new ArrayList<mapaadmin.dao.SedeInfo>(sedeInfoList.size());
                for (mapaadmin.dao.SedeInfo E : sedeInfoList) {
                    merged.add(ucentral2PUEntityManager.merge(E));
                }
                sedeInfoList.clear();
                sedeInfoList.addAll(merged);
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
                java.util.Collection data = sedeInfoQuery.getResultList();
                for (Object entity : data) {
                    ucentral2PUEntityManager.refresh(entity);
                }
                //Thread.sleep(1300L); // remove for real app
                setProgress(4, 0, 4);

                Thread.sleep(150L); // remove for real app
                sedeInfoList.clear();
                sedeInfoList.addAll(data);
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
        sedeInfoQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT s FROM SedeInfo s");
        sedeInfoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : org.jdesktop.observablecollections.ObservableCollections.observableList(sedeInfoQuery.getResultList());
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSede = new javax.swing.JTable();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        lblIdSede = new javax.swing.JTextField();
        lblNombre = new javax.swing.JTextField();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewSede.class);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setLocationByPlatform(true);
        setName("Form"); // NOI18N
        setResizable(false);

        javax.swing.ActionMap actionMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getActionMap(JDNewSede.class, this);
        jButton1.setAction(actionMap.get("save")); // NOI18N
        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setName("jButton1"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        tblSede.setName("tblSede"); // NOI18N
        tblSede.getTableHeader().setReorderingAllowed(false);

        org.jdesktop.swingbinding.JTableBinding jTableBinding = org.jdesktop.swingbinding.SwingBindings.createJTableBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, sedeInfoList, tblSede);
        org.jdesktop.swingbinding.JTableBinding.ColumnBinding columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${idSede}"));
        columnBinding.setColumnName("Id Sede");
        columnBinding.setColumnClass(Integer.class);
        columnBinding.setEditable(false);
        columnBinding = jTableBinding.addColumnBinding(org.jdesktop.beansbinding.ELProperty.create("${nomSede}"));
        columnBinding.setColumnName("Nombre");
        columnBinding.setColumnClass(String.class);
        columnBinding.setEditable(false);
        bindingGroup.addBinding(jTableBinding);
        jTableBinding.bind();
        jScrollPane1.setViewportView(tblSede);
        tblSede.getColumnModel().getColumn(0).setHeaderValue(resourceMap.getString("tblSede.columnModel.title0")); // NOI18N

        jButton3.setAction(actionMap.get("newRecordSede")); // NOI18N
        jButton3.setIcon(resourceMap.getIcon("jButton3.icon")); // NOI18N
        jButton3.setText(resourceMap.getString("jButton3.text")); // NOI18N
        jButton3.setToolTipText(resourceMap.getString("jButton3.toolTipText")); // NOI18N
        jButton3.setName("jButton3"); // NOI18N

        jButton4.setAction(actionMap.get("deleteRecordSede")); // NOI18N
        jButton4.setIcon(resourceMap.getIcon("jButton4.icon")); // NOI18N
        jButton4.setText(resourceMap.getString("jButton4.text")); // NOI18N
        jButton4.setToolTipText(resourceMap.getString("jButton4.toolTipText")); // NOI18N
        jButton4.setName("jButton4"); // NOI18N

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jLabel2.setText(resourceMap.getString("jLabel2.text")); // NOI18N
        jLabel2.setName("jLabel2"); // NOI18N

        lblIdSede.setName("lblIdSede"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblSede, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.idSede}"), lblIdSede, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        lblNombre.setName("lblNombre"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tblSede, org.jdesktop.beansbinding.ELProperty.create("${selectedElement.nomSede}"), lblNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        jButton2.setText(resourceMap.getString("jButton2.text")); // NOI18N
        jButton2.setName("jButton2"); // NOI18N
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarSede(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 272, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblIdSede, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
                            .addComponent(lblNombre, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jButton3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton4)
                        .addGap(22, 22, 22)
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton2)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 124, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(lblIdSede, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(lblNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton4)
                    .addComponent(jButton3)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jButton2)
                        .addComponent(jButton1)))
                .addContainerGap(16, Short.MAX_VALUE))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelarSede(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarSede
        setVisible(false);
    }//GEN-LAST:event_cancelarSede

   

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField lblIdSede;
    private javax.swing.JTextField lblNombre;
    private java.util.List<mapaadmin.dao.SedeInfo> sedeInfoList;
    private javax.persistence.Query sedeInfoQuery;
    private javax.swing.JTable tblSede;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables

private boolean saveNeeded;    
}
