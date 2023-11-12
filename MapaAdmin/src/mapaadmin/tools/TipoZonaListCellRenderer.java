/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;
import mapaadmin.dao.TipoZona;

/**
 *
 * @author techno
 */
public class TipoZonaListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = 222542544607145570L;

    @Override
    public Component getListCellRendererComponent(
           JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){
        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof TipoZona){
            TipoZona tz = (TipoZona) value;
            setText(tz.getNomTipoZona());
        }
        return this;
    }
}
