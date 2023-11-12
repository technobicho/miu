
package mapaadmin.tools;

import mapaadmin.dao.CargoFuncionario;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 *
 * @author David Acosta
 */
public class CargoListCellRenderer extends DefaultListCellRenderer {
    private static final long serialVersionUID = 6600501019348136286L;



    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){

        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof CargoFuncionario){
            CargoFuncionario C = (CargoFuncionario) value;
            setText(C.getNomCargo());
        }
        return this;
    }
}
