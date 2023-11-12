/*
 * MapaAdminApp.java
 */
package mapaadmin;

import java.awt.Component;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.URL;
import java.util.EventObject;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import oracle.toplink.essentials.config.TopLinkProperties;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jdesktop.application.Action;
import org.jdesktop.application.Application;
import org.jdesktop.application.SingleFrameApplication;
import org.jdesktop.application.Task;

/**
 * The main class of the application.
 */
public class MapaAdminApp extends SingleFrameApplication implements Application.ExitListener {



    private MapaAdminView view;
    private LoginDialog login;
    private LoginManager logMan = new LoginManager();
    private Map<String,String> properties = new HashMap<String,String>();
    static Logger logger = Logger.getLogger(MapaAdminApp.class);

    /**
     * At startup create and show the main frame of the application.
     */
    @Override
    protected void startup() {
        addExitListener(this);
        MapaAdminApp.log4jPostgres();

        JFrame mainFrame = MapaAdminApp.getApplication().getMainFrame();
        mainFrame.addWindowListener(new MainFrameListener());
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

//        view = new MapaAdminView(this, properties);
//        show(view);

        logMan.addListener(this);
        login = new LoginDialog(mainFrame, true);
        show(login);
    }

    private class MainFrameListener extends WindowAdapter {

        @Override
        public void windowClosing(WindowEvent e) {
            exit(e);
        }
    }

    /**
     * This method is to initialize the specified window by injecting resources.
     * Windows shown in our application come fully initialized from the GUI
     * builder, so this additional configuration is not needed.
     */
    @Override
    protected void configureWindow(java.awt.Window root) {
    }

    /**
     * A convenient static getter for the application instance.
     * @return the instance of MapaAdminApp
     */
    public static MapaAdminApp getApplication() {
        return Application.getInstance(MapaAdminApp.class);
    }

    @Action
    public void logout() {
        logMan.logOut();
    }

    @Action(block = Task.BlockingScope.WINDOW)
    public Task login() {
        return new LoginTask(org.jdesktop.application.Application.getInstance(mapaadmin.MapaAdminApp.class));
    }

    void notifyLoginChange(boolean loggedIn) {

        if (loggedIn) {
            view = new MapaAdminView(this, properties);
            show(view);
            login.dispose();
        } else {
            this.exit();
        }
    }

    @Override
    public boolean canExit(EventObject arg0) {
        Object source = (arg0 != null) ? arg0.getSource() : null;
        Component owner = (source instanceof Component) ? (Component) source : null;
        int option = JOptionPane.showConfirmDialog(owner, "Desea Salir?");
        return option == JOptionPane.YES_OPTION;
    }

    @Override
    public void willExit(EventObject arg0) {
    }

    private class LoginTask extends org.jdesktop.application.Task<LoginDialog, Void> {

        LoginTask(org.jdesktop.application.Application app) {
            super(app);
        }

        @Override
        protected LoginDialog doInBackground() {
            try {
                String host = login.getJtfHost().getText();
                String puerto = login.getJtfPuerto().getText();
                String bd = login.getJtfBD().getText();
                String usuario = login.getJtfUsuario().getText();
                char[] pwd = login.getJpfContrasenia().getPassword();
                properties.put(TopLinkProperties.JDBC_DRIVER,"org.postgresql.Driver");
                properties.put(TopLinkProperties.JDBC_URL, "jdbc:postgresql://" + host + ":" + puerto + "/" + bd);
                properties.put(TopLinkProperties.JDBC_USER, usuario);
                properties.put(TopLinkProperties.JDBC_PASSWORD, new String(pwd));

                

                setMessage("Validando....");

                Thread.sleep(1);

                logMan.login();
                logger.info("Usuario ingresa: " + usuario);

            } catch (InterruptedException ex) {
//                Logger.getLogger(MapaAdminApp.class.getName()).log(Level.SEVERE, null, ex);
                logger.error(ex);
            }
            return null;
        }
    }

    private static void log4jPostgres() {
       URL url = MapaAdminApp.class.getResource("resources/Log4jPostgres.properties");
       PropertyConfigurator.configure(url);
    }

    /**
     * Main method launching the application.
     */
    public static void main(String[] args) {
        launch(MapaAdminApp.class, args);
    }
}
