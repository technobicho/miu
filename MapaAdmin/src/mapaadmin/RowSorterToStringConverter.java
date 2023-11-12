
package mapaadmin;

import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import org.jdesktop.beansbinding.Converter;


/**
 *
 * @author David Acosta
 */
public class RowSorterToStringConverter extends Converter {

    private JTable table;

    public JTable getTable() {
        return table;
    }

    public void setTable(JTable table) {
        this.table = table;
    }

    @Override
    public Object convertForward(Object value) {
        return value.toString();
    }

    @Override
    public Object convertReverse(Object mask) {
        TableModel tm = table.getModel();
        TableRowSorter<TableModel> sorter = new TableRowSorter<TableModel>(tm);

        String m = mask.toString();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < m.length(); i++) {
            char c = m.charAt(i);
            sb.append('[').append(Character.toLowerCase(c)).append(Character.toUpperCase(c)).append(']');
        }
        sorter.setRowFilter(RowFilter.regexFilter(".*" + sb + ".*"));
        return sorter;
    }
}
