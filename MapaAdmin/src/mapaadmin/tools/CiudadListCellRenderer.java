
package mapaadmin.tools;

import mapaadmin.dao.Ciudad;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 *
 * @author David Acosta
 */
public class CiudadListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = 8729512773849180286L;

    
    
    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){

        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof Ciudad){
            Ciudad C = (Ciudad) value;
            setText(C.getNomCiudad());
        }
        return this;
    }
}
