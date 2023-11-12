/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.aplicacion;

import org.zkoss.zul.Label;
import org.zkoss.zul.Row;
import org.zkoss.zul.RowRenderer;

/**
 *
 * @author techno
 */
public class HrowRender implements RowRenderer {

    @Override
    public void render(Row row, Object data) {
        String[] _data = (String[]) data;
        for (String i : _data) {
            new Label(i).setParent(row);
        }
    }
}
