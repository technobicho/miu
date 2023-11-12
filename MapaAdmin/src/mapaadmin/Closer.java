
package mapaadmin;

import java.awt.Component;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JOptionPane;

/**
 *
 * @author David Acosta
 */
public class Closer extends WindowAdapter {

    @Override
    public void windowClosing(WindowEvent e) {
        Object source = (e != null) ? e.getSource() : null;
        Component owner = (source instanceof Component) ? (Component) source : null;
        int option = JOptionPane.showConfirmDialog(owner, "Desea Salir?");
        if (option == JOptionPane.YES_OPTION) {
            System.exit(0);
        }
    }
}
