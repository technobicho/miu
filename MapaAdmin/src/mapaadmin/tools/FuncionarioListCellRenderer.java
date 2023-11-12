/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin.tools;

import java.awt.Component;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;
import mapaadmin.dao.CargoFuncionario;
/**
 *
 * @author David Acosta
 */
public class FuncionarioListCellRenderer extends DefaultListCellRenderer{
    private static final long serialVersionUID = -1137124982683456989L;

   
    @Override
    public Component getListCellRendererComponent(
            JList list, Object value, int index, boolean isSelected, boolean cellHasFocus){

        super.getListCellRendererComponent(list, value, TOP, isSelected, isSelected);
        if(value instanceof CargoFuncionario){
            CargoFuncionario F = (CargoFuncionario) value;
            setText(F.getNomCargo());
        }
        return this;
    }
}
