
package mapaadmin;

import javax.swing.InputVerifier;
import javax.swing.JComponent;
import javax.swing.JFormattedTextField;
import javax.swing.JOptionPane;

/**
 *
 * @author David Acosta
 */
public class DateVerifier extends InputVerifier {

    @Override
    public boolean shouldYieldFocus(JComponent input) {
        boolean inputOK = verify(input);

        if (inputOK) {
            return true;
        }


        String failedVerificationMessage = "La fecha debe estar en formato DD/MM/YYYY. Por ejemplo: 17/04/2008";
        JOptionPane.showMessageDialog(null, //no owner frame
                failedVerificationMessage,
                "Formato invalido de fecha", //title
                JOptionPane.WARNING_MESSAGE);

        //Reinstall the input verifier.
        input.setInputVerifier(this);
        return false;
    }

    @Override
    public boolean verify(JComponent input) {
        if (!(input instanceof JFormattedTextField)) {
            return true;
        }
        return ((JFormattedTextField) input).isEditValid();
    }
}
