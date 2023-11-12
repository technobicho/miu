/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import org.jdesktop.beansbinding.Converter;

/**
 *
 * @author techno
 */
public class ImageConverter extends Converter {

    //byte to image
    public Icon convertForward(Object arg) {
        try {
            byte[] bytearray = (byte [])arg;
            InputStream in = new ByteArrayInputStream(bytearray);
            BufferedImage imag = ImageIO.read(in);
            if(imag != null){
                return new ImageIcon(imag.getScaledInstance(150, 100, BufferedImage.SCALE_SMOOTH));
            }
        } catch (IOException ex) {
            Logger.getLogger(ImageConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Object convertReverse(Object value) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
