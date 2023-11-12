
package mapaadmin;

import javax.swing.InputVerifier;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;

/**
 *
 * @author David Acosta
 */
public class EmptyVeriferJtajsp extends InputVerifier {

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
        if (!(input instanceof JTextArea)) {
            return true;
        }
        String text = ((JTextArea) input).getText();
        if (text.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }
}
