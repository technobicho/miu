/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mapaadmin;

import java.awt.Window;
import java.util.EventObject;
import org.jdesktop.application.Task;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author techno
 */
public class MapaAdminAppTest {

    public MapaAdminAppTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of startup method, of class MapaAdminApp.
     */
    @Test
    public void testStartup() {
        System.out.println("startup");
        MapaAdminApp instance = new MapaAdminApp();
        instance.startup();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of configureWindow method, of class MapaAdminApp.
     */
    @Test
    public void testConfigureWindow() {
        System.out.println("configureWindow");
        Window root = null;
        MapaAdminApp instance = new MapaAdminApp();
        instance.configureWindow(root);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getApplication method, of class MapaAdminApp.
     */
    @Test
    public void testGetApplication() {
        System.out.println("getApplication");
        MapaAdminApp expResult = null;
        MapaAdminApp result = MapaAdminApp.getApplication();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of logout method, of class MapaAdminApp.
     */
    @Test
    public void testLogout() {
        System.out.println("logout");
        MapaAdminApp instance = new MapaAdminApp();
        instance.logout();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of login method, of class MapaAdminApp.
     */
    @Test
    public void testLogin() {
        System.out.println("login");
        MapaAdminApp instance = new MapaAdminApp();
        Task expResult = null;
        Task result = instance.login();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of notifyLoginChange method, of class MapaAdminApp.
     */
    @Test
    public void testNotifyLoginChange() {
        System.out.println("notifyLoginChange");
        boolean loggedIn = false;
        MapaAdminApp instance = new MapaAdminApp();
        instance.notifyLoginChange(loggedIn);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of canExit method, of class MapaAdminApp.
     */
    @Test
    public void testCanExit() {
        System.out.println("canExit");
        EventObject arg0 = null;
        MapaAdminApp instance = new MapaAdminApp();
        boolean expResult = false;
        boolean result = instance.canExit(arg0);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of willExit method, of class MapaAdminApp.
     */
    @Test
    public void testWillExit() {
        System.out.println("willExit");
        EventObject arg0 = null;
        MapaAdminApp instance = new MapaAdminApp();
        instance.willExit(arg0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class MapaAdminApp.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        MapaAdminApp.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

}