/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin;

import javax.swing.InputVerifier;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author David Acosta
 */
public class EmptyVeriferjtf extends InputVerifier {

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
        if (!(input instanceof JTextField)) {
            return true;
        }
        String text = ((JTextField) input).getText();
        if (text.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }
}
