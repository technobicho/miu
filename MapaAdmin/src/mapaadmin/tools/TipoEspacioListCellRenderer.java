/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import mapaadmin.dao.TipoEspacio;
import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

/**
 *
 * @author David Acosta
 */
public class TipoEspacioListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = 8025175106062369919L;


    
    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){

        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof TipoEspacio){
            TipoEspacio C = (TipoEspacio) value;
            setText(C.getNomTipoEspacio());
        }
        return this;
    }
}
