/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin;

import java.io.File;
import javax.swing.filechooser.FileFilter;

/**
 *
 * @author David Acosta
 */
public class FilterFile  extends FileFilter{
    //descripcion y extension para el filtro
    private String descripcion;
    private String extension;

    public FilterFile(String descripcion, String extension){
        if(descripcion == null || extension == null){
            throw new NullPointerException("La descripcion (o extension) no puede ser null!");
        }
        this.descripcion = descripcion;
        this.extension = extension;
    }

    @Override
    public boolean accept(File arg0) {
        if(arg0.isDirectory()){
            return true;
        }
        String nombreArchivo = arg0.getName().toLowerCase();
        return nombreArchivo.endsWith(extension);
    }

    @Override
    public String getDescription() {
        return descripcion;
    }

}
