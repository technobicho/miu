/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin;

import javax.swing.InputVerifier;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JOptionPane;

/**
 *
 * @author David Acosta
 */
public class EmptyVerifercbx extends InputVerifier {

    @Override
    public boolean shouldYieldFocus(JComponent input) {
        boolean inputOK = verify(input);
        if (inputOK) {
            return true;
        }

        String failedVerificationMessage = "No se permiten datos Nulos";
        JOptionPane.showMessageDialog(null, failedVerificationMessage,
                "Campo Vacio", JOptionPane.WARNING_MESSAGE);
        input.setInputVerifier(this);
        return false;
    }

    @Override
    public boolean verify(JComponent input) {
        if (!(input instanceof JComboBox)) {
            return true;
        }
        Object obj = ((JComboBox) input).getSelectedItem();
        if (obj == null) {
            return false;
        } else {
            return true;
        }
    }
}
