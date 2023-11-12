/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import mapaadmin.dao.TipoUso;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 *
 * @author David Acosta
 */
public class UsoListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = -8634071690764344938L;

    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){

        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof TipoUso){
            TipoUso tu = (TipoUso) value;
            setText(tu.getNomTipoUso());
        }
        return this;
    }
}
