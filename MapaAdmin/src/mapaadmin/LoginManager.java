/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mapaadmin;

/**
 *
 * @author AdminLoc
 */
public class LoginManager {


    private boolean loggedIn = false;
    private MapaAdminApp listener;

    public void login() {
        loggedIn = true;
        informListeners();
    }

    public void logOut() {
        loggedIn = false;
        informListeners();
    }

    public void addListener(MapaAdminApp listener) {
        this.listener = listener;
    }

    private void informListeners() {
        listener.notifyLoginChange(loggedIn);
    }
}
