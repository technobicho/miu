/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ucentral.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Clase que permite calcular el periodo academico segun la fecha actual del sistema
 * @author David Acosta
 * @version 1.0
 */
public class CalculaPeriodo {
    private Date fecha = new Date();
    private String periodo;

    /**
     * Metodo que inicializa el objeto CalcularPeriodo
     */
    public  CalculaPeriodo(){
       SimpleDateFormat fanio = new SimpleDateFormat("yyyy");
       SimpleDateFormat fmes = new SimpleDateFormat("MM");
       String anio = fanio.format(fecha);
       String mes = fmes.format(fecha);
       periodo = calPeriodo(Integer.parseInt(anio),Integer.parseInt(mes));
    }

    /**
     * Metodo que realiza el calculo del periodo
     * @param anio valor numerico del año
     * @param mes valor numerico del mes
     * @return valor del periodo en el formato anio-periodo
     */
    private String  calPeriodo(int anio, int mes){
        String peri = "-01";
        if(mes >= 1 && mes <= 6){
            peri = "-01";
        }else if (mes >= 7 && mes <= 12){
            peri = "-02";
        }
        return anio + peri;
    }

    /**
     * Metodo para obtener el valor del periodo
     * @return cadena con el valor del periodo actual
     */
    public String getPeriodo(){
        return periodo;
    }
}
