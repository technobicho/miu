/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewSpace.java
 *
 * Created on 29/04/2009, 08:02:21 PM
 */
package mapaadmin.gui;

import mapaadmin.dao.EdificioEspacio;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import javax.swing.JOptionPane;

/**
 *
 * @author David Acosta
 */
public class JDNewSpace extends javax.swing.JDialog {
    private static final long serialVersionUID = 5234008786950127977L;

    
    protected EdificioEspacio currentRecord;
    protected PropertyChangeSupport propertyChangeSupport = new PropertyChangeSupport(this);

    /** Creates new form JDNewSpace */
    public JDNewSpace(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }
    protected boolean espacioConfirmed;

    /**
     * Get the value of espacioConfirmed
     *
     * @return the value of espacioConfirmed
     */
    public boolean isEspacioConfirmed() {
        return espacioConfirmed;
    }

    /**
     * Set the value of espacioConfirmed
     *
     * @param espacioConfirmed new value of espacioConfirmed
     */
    public void setEspacioConfirmed(boolean espacioConfirmed) {
        this.espacioConfirmed = espacioConfirmed;
    }

    public EdificioEspacio getCurrentRecord() {
        return currentRecord;
    }

    public void setCurrentRecord(EdificioEspacio currentRecord) {
        EdificioEspacio oldEdificioEspacio = this.currentRecord;
        this.currentRecord = currentRecord;
        propertyChangeSupport.firePropertyChange("currentRecord", oldEdificioEspacio, currentRecord);
    }

    @Override
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.addPropertyChangeListener(listener);
    }

    @Override
    public void removePropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.removePropertyChangeListener(listener);
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
        edificioEspacioQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT e FROM EdificioEspacio e");
        edificioEspacioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : edificioEspacioQuery.getResultList();
        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewSpace.class);
        tipoEspacioQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery(resourceMap.getString("tipoEspacioQuery.query")); // NOI18N
        tipoEspacioList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : tipoEspacioQuery.getResultList();
        tipoEspacioListCellRenderer1 = new mapaadmin.tools.TipoEspacioListCellRenderer();
        emptyVerifercbx2 = new mapaadmin.EmptyVerifercbx();
        emptyVeriferJtajsp2 = new mapaadmin.EmptyVeriferJtajsp();
        lblNombre = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jtaNombre = new javax.swing.JTextArea();
        lblTipo = new javax.swing.JLabel();
        cbxTipo = new javax.swing.JComboBox();
        btnGuardar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();

        tipoEspacioListCellRenderer1.setText(resourceMap.getString("tipoEspacioListCellRenderer1.text")); // NOI18N
        tipoEspacioListCellRenderer1.setName("tipoEspacioListCellRenderer1"); // NOI18N

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setLocationByPlatform(true);
        setModal(true);
        setName("Form"); // NOI18N

        lblNombre.setText(resourceMap.getString("lblNombre.text")); // NOI18N
        lblNombre.setName("lblNombre"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        jtaNombre.setColumns(20);
        jtaNombre.setLineWrap(true);
        jtaNombre.setRows(5);
        jtaNombre.setName("jtaNombre"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.nomEspacio}"), jtaNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        jScrollPane1.setViewportView(jtaNombre);

        lblTipo.setText(resourceMap.getString("lblTipo.text")); // NOI18N
        lblTipo.setName("lblTipo"); // NOI18N

        cbxTipo.setName("cbxTipo"); // NOI18N
        cbxTipo.setRenderer(tipoEspacioListCellRenderer1);

        org.jdesktop.swingbinding.JComboBoxBinding jComboBoxBinding = org.jdesktop.swingbinding.SwingBindings.createJComboBoxBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoEspacioList, cbxTipo);
        bindingGroup.addBinding(jComboBoxBinding);
        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.espacioTipo}"), cbxTipo, org.jdesktop.beansbinding.BeanProperty.create("selectedItem"));
        bindingGroup.addBinding(binding);

        btnGuardar.setText(resourceMap.getString("btnGuardar.text")); // NOI18N
        btnGuardar.setName("btnGuardar"); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarEspacio(evt);
            }
        });

        btnCancelar.setText(resourceMap.getString("btnCancelar.text")); // NOI18N
        btnCancelar.setName("btnCancelar"); // NOI18N
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelarEspacio(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 271, Short.MAX_VALUE)
                    .addComponent(lblNombre)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(lblTipo)
                        .addGap(18, 18, 18)
                        .addComponent(cbxTipo, 0, 226, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(btnGuardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCancelar)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblNombre)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblTipo)
                    .addComponent(cbxTipo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancelar)
                    .addComponent(btnGuardar))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private boolean validarCampos() {
        if (cbxTipo.getSelectedItem() == null) {
            mensajeDeVacio();
            return false;
        } else if (jtaNombre.getText().isEmpty()) {
            mensajeDeVacio();
            return false;
        }
        return true;
    }

    private void mensajeDeVacio() {
        JOptionPane.showMessageDialog(this, "El campo esta vacio",
                "Alerta", JOptionPane.WARNING_MESSAGE);
    }
    private void guardarEspacio(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarEspacio
        if (validarCampos()) {
            setEspacioConfirmed(true);
            setVisible(false);
        }
    }//GEN-LAST:event_guardarEspacio

    private void cancelarEspacio(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelarEspacio
        setEspacioConfirmed(false);
        setVisible(false);
    }//GEN-LAST:event_cancelarEspacio
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JComboBox cbxTipo;
    private java.util.List<mapaadmin.dao.EdificioEspacio> edificioEspacioList;
    private javax.persistence.Query edificioEspacioQuery;
    private mapaadmin.EmptyVeriferJtajsp emptyVeriferJtajsp2;
    private mapaadmin.EmptyVerifercbx emptyVerifercbx2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jtaNombre;
    private javax.swing.JLabel lblNombre;
    private javax.swing.JLabel lblTipo;
    private java.util.List<mapaadmin.dao.TipoEspacio> tipoEspacioList;
    private mapaadmin.tools.TipoEspacioListCellRenderer tipoEspacioListCellRenderer1;
    private javax.persistence.Query tipoEspacioQuery;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
