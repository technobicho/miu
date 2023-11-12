/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;
import mapaadmin.dao.TipoCargo;

/**
 *
 * @author David
 */
public class TipoCargoListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = -9099735741598362979L;


    @Override
    public Component getListCellRendererComponent(JList list, Object value, int index,
    boolean isSelected, boolean cellHasFocus){
        super.getListCellRendererComponent(list, value, TOP,isSelected,isSelected);
        if(value instanceof TipoCargo){
            TipoCargo tc = (TipoCargo) value;
            setText(tc.getNomTipocargo());
        }
        return this;
    }

}
