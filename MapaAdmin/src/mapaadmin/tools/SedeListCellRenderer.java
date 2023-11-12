/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import mapaadmin.dao.SedeInfo;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 *
 * @author David Acosta
 */
public class SedeListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = -2976340133614197205L;


    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){
        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof SedeInfo){
            SedeInfo C = (SedeInfo) value;
            setText(C.getNomSede());
        }
        return this;
    }

}
