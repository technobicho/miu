/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucentral.tools;

import co.edu.ucentral.modelo.EdfLocaliza;
import co.edu.ucentral.modelo.EdificioInfo;
import co.edu.ucentral.modelo.SedeInfo;
import co.edu.ucentral.modelo.SedeLocaliza;
import co.edu.ucentral.modelo.ZonaInfo;
import co.edu.ucentral.modelo.ZonaLocaliza;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 * Clase que realiza la consulta y crea la url para el iframe, que consume
 * los servicios wms del servidor de mapas
 * @author David Acosta
 * @version 1.0
 */
public class LocalizarEnMapa {

    private String iframeSrc = "";
    private double coorX = 0;
    private double coorY = 0;
    private String nom = "";
    private EntityManagerFactory emf;
    private EntityManager em;

    /**
     * Localizacion de edificios en el mapa, genera una secuencia html, para el iframe
     * @param idEdf
     */
    public LocalizarEnMapa() {
        emf = Persistence.createEntityManagerFactory("Miu2PU");
    }

    /**
     *Metodo que realiza la consulta de localizacion para edificios
     * @param ei
     * @return retorna el url para el iframe
     */
    public String localizaEdificio(EdificioInfo ei) {
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("EdfLocaliza.findByIdEdifici").setParameter("idEdifici", ei.getIdEdificio());
        EdfLocaliza edfLoca = (EdfLocaliza) q.getSingleResult();
        em.close();
        nom = edfLoca.getNomEdificio();
        coorX = edfLoca.getX();
        coorY = edfLoca.getY();
        return getIframeSrc();
    }

    /**
     * Metodo que realiza la consulta de localizacion para sedes
     * @param si
     * @return retorna el url para el iframe
     */
    public String localizaSede(SedeInfo si) {
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("SedeLocaliza.findByIdSede").setParameter("idSede", si.getIdSede());
        SedeLocaliza sedeLoca = (SedeLocaliza) q.getSingleResult();
        em.close();
        nom = sedeLoca.getNomSede();
        coorX = sedeLoca.getX();
        coorY = sedeLoca.getY();
        return getIframeSrc();
    }

    /**
     * Metodo que realiza la consulta de localizacion para zonas
     * @param zi
     * @return retorna el url para el iframe
     */
    public String localizaZona(ZonaInfo zi) {
        em = emf.createEntityManager();
        Query q = em.createNamedQuery("ZonaLocaliza.findByIdZona").setParameter("idZona", zi.getIdZona());
        ZonaLocaliza zonaLoca = (ZonaLocaliza) q.getSingleResult();
        em.close();
        nom = zonaLoca.getNomZona();
        coorX = zonaLoca.getX();
        coorY = zonaLoca.getY();
        return getIframeSrc();
    }

    /**
     * Retorna el url para el mapa con la posicion definida X,Y
     * @return the iframeSrc
     */
    private String getIframeSrc() {
        iframeSrc = "mapa.html?x=" + coorX + "&" + "y=" + coorY + "&nom=" + nom + "#top";
        return iframeSrc;
    }
}
