/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.jdesktop.beansbinding.Converter;

/**
 *
 * @author techno
 */
public class ImageTextConverter extends Converter {
//byte to String

    public String convertForward(Object arg) {
        byte[] bytearray = (byte[]) arg;
        String base64String = Base64.encode(bytearray);
        return base64String;
    }

//String to byte
    public byte[] convertReverse(Object arg) {
        String s = (String) arg;
        if (!s.isEmpty())  {
            byte[] bytearray = Base64.decode(s);
            return bytearray;
        }
        return null;
    }
}
