/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * JDNewBuilding.java
 *
 * Created on 13/04/2009, 08:27:43 PM
 */
package mapaadmin.gui;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapaadmin.dao.EdificioInfo;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;
import javax.swing.JFileChooser;
import mapaadmin.FilterFile;
import mapaadmin.ImagePreviewPanel;
import mapaadmin.Pictures;

/**
 *
 * @author David Acosta
 */
public class JDNewBuilding extends javax.swing.JDialog {

    private static final long serialVersionUID = -1973742326684647383L;
    private static final int ACCSIZE = 640;

    /** Creates new form JDNewBuilding */
    public JDNewBuilding(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }
    protected EdificioInfo currentRecord;

    /**
     * Get the value of currentRecord
     *
     * @return the value of currentRecord
     */
    public EdificioInfo getCurrentRecord() {
        return currentRecord;
    }

    /**
     * Set the value of currentRecord
     *
     * @param currentRecord new value of currentRecord
     */
    public void setCurrentRecord(EdificioInfo currentRecord) {
        EdificioInfo oldEdificioInfo = this.currentRecord;
        this.currentRecord = currentRecord;
        propertyChangeSupport.firePropertyChange("currentRecord", oldEdificioInfo, currentRecord);

    }
    protected boolean EdificioConfirmed;

    /**
     * Get the value of EdificioConfirmed
     *
     * @return the value of EdificioConfirmed
     */
    public boolean isEdificioConfirmed() {
        return EdificioConfirmed;
    }

    /**
     * Set the value of EdificioConfirmed
     *
     * @param EdificioConfirmed new value of EdificioConfirmed
     */
    public void setEdificioConfirmed(boolean EdificioConfirmed) {
        this.EdificioConfirmed = EdificioConfirmed;
    }
    private PropertyChangeSupport propertyChangeSupport = new PropertyChangeSupport(this);

    /**
     * Add PropertyChangeListener.
     *
     * @param listener
     */
    @Override
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        propertyChangeSupport.addPropertyChangeListener(listener);
    }

    /**
     * Remove PropertyChangeListener.
     *
     * @param listener
     */
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
        ciudadQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT c FROM Ciudad c");
        ciudadList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : ciudadQuery.getResultList();
        ciudadListCellRenderer2 = new mapaadmin.tools.CiudadListCellRenderer();
        sedeListCellRenderer1 = new mapaadmin.tools.SedeListCellRenderer();
        sedeInfoQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT s FROM SedeInfo s");
        sedeInfoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : sedeInfoQuery.getResultList();
        sedeListCellRenderer2 = new mapaadmin.tools.SedeListCellRenderer();
        dateVerifier2 = new mapaadmin.DateVerifier();
        tipoUsoQuery = java.beans.Beans.isDesignTime() ? null : ucentral2PUEntityManager.createQuery("SELECT t FROM TipoUso t");
        tipoUsoList = java.beans.Beans.isDesignTime() ? java.util.Collections.emptyList() : tipoUsoQuery.getResultList();
        usoListCellRenderer2 = new mapaadmin.tools.UsoListCellRenderer();
        emptyVeriferjtf1 = new mapaadmin.EmptyVeriferjtf();
        emptyVerifercbx1 = new mapaadmin.EmptyVerifercbx();
        imageConverter1 = new mapaadmin.ImageConverter();
        imageTextConverter1 = new mapaadmin.ImageTextConverter();
        lblIdedificio = new javax.swing.JLabel();
        jtfIdEdificio = new javax.swing.JTextField();
        lblNombre = new javax.swing.JLabel();
        jtfNombre = new javax.swing.JTextField();
        lblDireccion1 = new javax.swing.JLabel();
        jtfDireccion1 = new javax.swing.JTextField();
        lblDireccion2 = new javax.swing.JLabel();
        jtfDireccion2 = new javax.swing.JTextField();
        lblFecha = new javax.swing.JLabel();
        ftfFecha = new javax.swing.JFormattedTextField();
        lblCiudad = new javax.swing.JLabel();
        cbxCiudad = new javax.swing.JComboBox();
        lblSede = new javax.swing.JLabel();
        lblDescripcion = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jtaDescripcion = new javax.swing.JTextArea();
        lblFotografia = new javax.swing.JLabel();
        btnBuscar = new javax.swing.JToggleButton();
        btnGuardar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        cbxSede = new javax.swing.JComboBox();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        cbxUso = new javax.swing.JComboBox();
        jlblFoto = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jtaFoto = new javax.swing.JTextArea();
        jButton1 = new javax.swing.JButton();

        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class).getContext().getResourceMap(JDNewBuilding.class);
        ciudadListCellRenderer2.setText(resourceMap.getString("ciudadListCellRenderer2.text")); // NOI18N
        ciudadListCellRenderer2.setName("ciudadListCellRenderer2"); // NOI18N

        sedeListCellRenderer1.setText(resourceMap.getString("sedeListCellRenderer1.text")); // NOI18N
        sedeListCellRenderer1.setName("sedeListCellRenderer1"); // NOI18N

        sedeListCellRenderer2.setText(resourceMap.getString("sedeListCellRenderer2.text")); // NOI18N
        sedeListCellRenderer2.setName("sedeListCellRenderer2"); // NOI18N

        usoListCellRenderer2.setText(resourceMap.getString("usoListCellRenderer2.text")); // NOI18N
        usoListCellRenderer2.setName("usoListCellRenderer2"); // NOI18N

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(resourceMap.getString("Form.title")); // NOI18N
        setLocationByPlatform(true);
        setModal(true);
        setName("Form"); // NOI18N
        setResizable(false);

        lblIdedificio.setText(resourceMap.getString("lblIdedificio.text")); // NOI18N
        lblIdedificio.setName("lblIdedificio"); // NOI18N

        jtfIdEdificio.setName("jtfIdEdificio"); // NOI18N

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.idEdificio}"), jtfIdEdificio, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        lblNombre.setText(resourceMap.getString("lblNombre.text")); // NOI18N
        lblNombre.setName("lblNombre"); // NOI18N

        jtfNombre.setName("jtfNombre"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.nomEdificio}"), jtfNombre, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        lblDireccion1.setText(resourceMap.getString("lblDireccion1.text")); // NOI18N
        lblDireccion1.setName("lblDireccion1"); // NOI18N

        jtfDireccion1.setName("jtfDireccion1"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.direccion1}"), jtfDireccion1, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        lblDireccion2.setText(resourceMap.getString("lblDireccion2.text")); // NOI18N
        lblDireccion2.setName("lblDireccion2"); // NOI18N

        jtfDireccion2.setName("jtfDireccion2"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.direccion2}"), jtfDireccion2, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        lblFecha.setText(resourceMap.getString("lblFecha.text")); // NOI18N
        lblFecha.setName("lblFecha"); // NOI18N

        ftfFecha.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.DateFormatter()));
        ftfFecha.setText(resourceMap.getString("ftfFecha.text")); // NOI18N
        ftfFecha.setInputVerifier(dateVerifier2);
        ftfFecha.setName("ftfFecha"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.fechaConstruccion}"), ftfFecha, org.jdesktop.beansbinding.BeanProperty.create("value"));
        bindingGroup.addBinding(binding);

        lblCiudad.setText(resourceMap.getString("lblCiudad.text")); // NOI18N
        lblCiudad.setName("lblCiudad"); // NOI18N

        cbxCiudad.setName("cbxCiudad"); // NOI18N
        cbxCiudad.setRenderer(ciudadListCellRenderer2);

        org.jdesktop.swingbinding.JComboBoxBinding jComboBoxBinding = org.jdesktop.swingbinding.SwingBindings.createJComboBoxBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, ciudadList, cbxCiudad);
        bindingGroup.addBinding(jComboBoxBinding);
        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.ciudad}"), cbxCiudad, org.jdesktop.beansbinding.BeanProperty.create("selectedItem"));
        bindingGroup.addBinding(binding);

        lblSede.setText(resourceMap.getString("lblSede.text")); // NOI18N
        lblSede.setName("lblSede"); // NOI18N

        lblDescripcion.setText(resourceMap.getString("lblDescripcion.text")); // NOI18N
        lblDescripcion.setName("lblDescripcion"); // NOI18N

        jScrollPane1.setName("jScrollPane1"); // NOI18N

        jtaDescripcion.setColumns(20);
        jtaDescripcion.setRows(5);
        jtaDescripcion.setName("jtaDescripcion"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.descripcion}"), jtaDescripcion, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        jScrollPane1.setViewportView(jtaDescripcion);

        lblFotografia.setText(resourceMap.getString("lblFotografia.text")); // NOI18N
        lblFotografia.setName("lblFotografia"); // NOI18N

        btnBuscar.setText(resourceMap.getString("btnBuscar.text")); // NOI18N
        btnBuscar.setName("btnBuscar"); // NOI18N
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarActionPerformed(evt);
            }
        });

        btnGuardar.setText(resourceMap.getString("btnGuardar.text")); // NOI18N
        btnGuardar.setName("btnGuardar"); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                saveEdificio(evt);
            }
        });

        btnCancelar.setText(resourceMap.getString("btnCancelar.text")); // NOI18N
        btnCancelar.setName("btnCancelar"); // NOI18N
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelEdificio(evt);
            }
        });

        cbxSede.setName("cbxSede"); // NOI18N
        cbxSede.setRenderer(sedeListCellRenderer2);

        jComboBoxBinding = org.jdesktop.swingbinding.SwingBindings.createJComboBoxBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, sedeInfoList, cbxSede);
        bindingGroup.addBinding(jComboBoxBinding);
        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.sede}"), cbxSede, org.jdesktop.beansbinding.BeanProperty.create("selectedItem"));
        bindingGroup.addBinding(binding);

        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jLabel2.setText(resourceMap.getString("jLabel2.text")); // NOI18N
        jLabel2.setName("jLabel2"); // NOI18N

        cbxUso.setName("cbxUso"); // NOI18N
        cbxUso.setRenderer(usoListCellRenderer2);

        jComboBoxBinding = org.jdesktop.swingbinding.SwingBindings.createJComboBoxBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, tipoUsoList, cbxUso);
        bindingGroup.addBinding(jComboBoxBinding);
        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.uso}"), cbxUso, org.jdesktop.beansbinding.BeanProperty.create("selectedItem"));
        bindingGroup.addBinding(binding);

        jlblFoto.setText(resourceMap.getString("jlblFoto.text")); // NOI18N
        jlblFoto.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jlblFoto.setName("jlblFoto"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.picture}"), jlblFoto, org.jdesktop.beansbinding.BeanProperty.create("icon"));
        binding.setConverter(imageConverter1);
        bindingGroup.addBinding(binding);

        jScrollPane2.setName("jScrollPane2"); // NOI18N

        jtaFoto.setColumns(20);
        jtaFoto.setEditable(false);
        jtaFoto.setRows(5);
        jtaFoto.setEnabled(false);
        jtaFoto.setFocusable(false);
        jtaFoto.setName("jtaFoto"); // NOI18N

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${currentRecord.picture}"), jtaFoto, org.jdesktop.beansbinding.BeanProperty.create("text"));
        binding.setSourceNullValue(null);
        binding.setConverter(imageTextConverter1);
        bindingGroup.addBinding(binding);

        jScrollPane2.setViewportView(jtaFoto);
        jScrollPane2.setVisible(false);
        jtaFoto.setVisible(false);

        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(lblIdedificio)
                        .addGap(22, 22, 22)
                        .addComponent(jtfIdEdificio, javax.swing.GroupLayout.PREFERRED_SIZE, 197, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(lblNombre)
                        .addGap(18, 18, 18)
                        .addComponent(jtfNombre, javax.swing.GroupLayout.DEFAULT_SIZE, 189, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(lblDescripcion)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(40, 40, 40)
                                .addComponent(cbxUso, 0, 219, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                .addComponent(lblSede)
                                .addGap(42, 42, 42)
                                .addComponent(cbxSede, 0, 211, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblDireccion1)
                                    .addComponent(lblFecha))
                                .addGap(12, 12, 12)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(ftfFecha, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE)
                                    .addComponent(jtfDireccion1, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE))))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                        .addComponent(lblDireccion2)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(jtfDireccion2, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                        .addComponent(jLabel1)
                                        .addGap(171, 171, 171))))
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                .addGap(29, 29, 29)
                                .addComponent(lblCiudad)
                                .addGap(18, 18, 18)
                                .addComponent(cbxCiudad, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 530, Short.MAX_VALUE))
                .addGap(36, 36, 36)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jlblFoto, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblFotografia)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(btnBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(18, 18, 18)
                            .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(jScrollPane2, 0, 0, Short.MAX_VALUE)))
                .addGap(26, 26, 26))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblIdedificio)
                    .addComponent(jtfIdEdificio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jtfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblFotografia)
                    .addComponent(lblNombre))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblDireccion1)
                            .addComponent(jtfDireccion1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jtfDireccion2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblDireccion2))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblFecha)
                            .addComponent(ftfFecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblSede)
                            .addComponent(cbxSede, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(cbxCiudad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblCiudad))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cbxUso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblDescripcion)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(17, 17, 17)
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnCancelar)
                            .addComponent(btnGuardar)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jlblFoto, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnBuscar)
                            .addComponent(jButton1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarActionPerformed
        FilterFile jpg = new FilterFile("Archivos JPG", ".jpg");
        JFileChooser chooser = new JFileChooser(".");
        ImagePreviewPanel preview = new ImagePreviewPanel();
        chooser.setAccessory(preview);
        chooser.addPropertyChangeListener(preview);
        chooser.addChoosableFileFilter(jpg);

        int retVal = chooser.showOpenDialog(this);
        if (retVal == JFileChooser.APPROVE_OPTION) {

            File file = chooser.getSelectedFile();


            try {
                ByteArrayOutputStream baos = new ByteArrayOutputStream(1000);
                BufferedImage img = ImageIO.read(file);
               // ImageIO.write(Pictures.toBufferedImage(scaleImage(img)), "jpg", baos);
                ImageIO.write(Pictures.toBufferedImage(img),"jpg",baos);
                baos.flush();
                String base64String = Base64.encode(baos.toByteArray());
                jtaFoto.setText(base64String);

            } catch (IOException ex) {
                Logger.getLogger(JDNewBuilding.class.getName()).log(Level.SEVERE, null, ex);
            } catch (OutOfMemoryError me) {
                Logger.getLogger(JDNewBuilding.class.getName()).log(Level.SEVERE, null, me);
            }
        }
}//GEN-LAST:event_btnBuscarActionPerformed

    /**
     * Escala la imagen de entrada seleccionada por el usuario
     * @param image
     * @return
     */
    private Image scaleImage(BufferedImage image) {
        int ancho, alto;

        ancho = image.getWidth();
        alto = image.getHeight();
        double ratio = 1.0;

        /*
         * Determinar la forma de escalar la imagen.
         */
        if(ancho >= alto){
            ratio = (double)(ACCSIZE-5)/ancho;
            ancho=ACCSIZE-5;
            alto=(int)(alto*ratio);
        }
        else{
            if(getHeight()>480){
                ratio=(double)(ACCSIZE-5)/alto;
                alto=ACCSIZE-5;
                ancho=(int)(ancho*ratio);
            }
            else{
                ratio=(double)getHeight()/alto;
                alto=getHeight();
                ancho=(int)(ancho*ratio);
            }
        }

        return image.getScaledInstance(ancho,alto, Image.SCALE_DEFAULT);

    }

    /**
     * Metodo que valida los campos que no permiten valores nulos
     * @return
     */
    private boolean validaCampos() {
        if (jtfIdEdificio.getText().isEmpty()) {
            showMessageToEmpty();
            jtfIdEdificio.requestFocus();
            return false;
        } else if (jtfNombre.getText().isEmpty()) {
            showMessageToEmpty();
            jtfNombre.requestFocus();
            return false;
        } else if (cbxSede.getSelectedItem() == null) {
            showMessageToEmpty();
            cbxSede.requestFocus();
            return false;
        } else if (cbxCiudad.getSelectedItem() == null) {
            showMessageToEmpty();
            cbxCiudad.requestFocus();
            return false;
        } else if (cbxUso.getSelectedItem() == null) {
            showMessageToEmpty();
            cbxUso.requestFocus();
            return false;
        }
        return true;
    }

    /**
     * Metodo que muestra el mensaje de campo vacio
     */
    private void showMessageToEmpty() {
        JOptionPane.showMessageDialog(this, "El campo esta vacio",
                "Atención", JOptionPane.WARNING_MESSAGE);
    }

    private void saveEdificio(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_saveEdificio
        if (validaCampos()) {
            setEdificioConfirmed(true);
            setVisible(false);
        }
    }//GEN-LAST:event_saveEdificio

    private void cancelEdificio(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelEdificio
        setEdificioConfirmed(false);
        setVisible(false);
    }//GEN-LAST:event_cancelEdificio

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        jtaFoto.setText("null");
        jtaFoto.setText(null);
    }//GEN-LAST:event_jButton1ActionPerformed
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton btnBuscar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JComboBox cbxCiudad;
    private javax.swing.JComboBox cbxSede;
    private javax.swing.JComboBox cbxUso;
    private java.util.List<mapaadmin.dao.Ciudad> ciudadList;
    private mapaadmin.tools.CiudadListCellRenderer ciudadListCellRenderer2;
    private javax.persistence.Query ciudadQuery;
    private mapaadmin.DateVerifier dateVerifier2;
    private mapaadmin.EmptyVerifercbx emptyVerifercbx1;
    private mapaadmin.EmptyVeriferjtf emptyVeriferjtf1;
    private javax.swing.JFormattedTextField ftfFecha;
    private mapaadmin.ImageConverter imageConverter1;
    private mapaadmin.ImageTextConverter imageTextConverter1;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel jlblFoto;
    private javax.swing.JTextArea jtaDescripcion;
    private javax.swing.JTextArea jtaFoto;
    private javax.swing.JTextField jtfDireccion1;
    private javax.swing.JTextField jtfDireccion2;
    private javax.swing.JTextField jtfIdEdificio;
    private javax.swing.JTextField jtfNombre;
    private javax.swing.JLabel lblCiudad;
    private javax.swing.JLabel lblDescripcion;
    private javax.swing.JLabel lblDireccion1;
    private javax.swing.JLabel lblDireccion2;
    private javax.swing.JLabel lblFecha;
    private javax.swing.JLabel lblFotografia;
    private javax.swing.JLabel lblIdedificio;
    private javax.swing.JLabel lblNombre;
    private javax.swing.JLabel lblSede;
    private java.util.List<mapaadmin.dao.SedeInfo> sedeInfoList;
    private javax.persistence.Query sedeInfoQuery;
    private mapaadmin.tools.SedeListCellRenderer sedeListCellRenderer1;
    private mapaadmin.tools.SedeListCellRenderer sedeListCellRenderer2;
    private java.util.List<mapaadmin.dao.TipoUso> tipoUsoList;
    private javax.persistence.Query tipoUsoQuery;
    private javax.persistence.EntityManager ucentral2PUEntityManager;
    private mapaadmin.tools.UsoListCellRenderer usoListCellRenderer2;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables
}
