import co.edu.ucentral.tools.ConexionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.zkoss.zul.api.Listitem;

public ConexionDB conx=null;

public void localizaEdf(){
	int index = lbxEdificios.getSelectedIndex();
	if(index > -1){
		Listitem li = lbxEdificios.getItemAtIndexApi(index);
		int idEdf = Integer.parseInt(li.getValue());
		//Messagebox.show(idEdf+"","valor",Messagebox.OK,Messagebox.ERROR);
		consultaMapa(idEdf);
	}
}

//Metodo que permite localizar en el mapa la Dependencia
public void localizaDep(){
    int idEdf;
    Treeitem ti = (Treeitem)tDependencias.getSelectedItem();
    if(ti.getParentItem() != null){
        Treerow tr = (Treerow) ti.getTreerow();
        Treecell tc = (Treecell)tr.getFirstChild();
        int index = Integer.parseInt(tc.getId());
        conectar();
        try{
            Statement stm = conx.con.createStatement();
            String sql = "SELECT ec.id_edificio FROM edf_cargo ec " +
                    "WHERE ec.id_cargo = " + index;
            ResultSet rst = stm.executeQuery(sql);
            while(rst.next()){
                idEdf = rst.getInt("id_edificio");
            }
        }catch(SQLException e4){
            Messagebox.show("Error en la sentencia SQL en localizaDep", "Error",
                Messagebox.OK, Messagebox.ERROR);
            e4.printStackTrace();
        }
        cerrarConexion();
        consultaMapa(idEdf);        
    }
}


private int edf_from_dep(idCargo){
    int idEdificio;
    conectar();
    try{
        Statement stm = conx.con.createStatement();
        ResultSet rst = stm.executeQuery("select ec.id_edificio " +
                        "from edf_cargo ec where ec.id_cargo = " + idCargo);
        while(rst.next()){
            idEdificio = (int)rst.getInteger("id_edificio");
        }
    }catch(SQLException e){
            Messagebox.show("Error en la sentencia SQL en consultarMapa", "Error",
                Messagebox.OK, Messagebox.ERROR);
            e.printStackTrace();
        }

        cerrarConexion();
        return idEdificio;
}

    


//Metodo que permite consultar la informacion de cada Dependencia
private void consultaDependencia(int idCargo){
    tapDepe.setSelected(true);
}

private void consultaMapa(int idEdf){
	
	float x_edf;
	float y_edf;
	
	conectar();
	try{
			Statement stm = conx.con.createStatement();
			ResultSet rst = stm.executeQuery("SELECT x(transform(edf_cent.centroid,4326)), " +
                            "y(transform(edf_cent.centroid,4326)) " +
							"FROM edf_cent " +
                            "WHERE edf_cent.id_edifici = " + idEdf);
			while(rst.next()){
				x_edf = (float)rst.getDouble("x");
				y_edf = (float)rst.getDouble("y");
				//Messagebox.show("lon: " + x_edf + " lat: " + y_edf, "Error",
                   // Messagebox.OK, Messagebox.ERROR);
			}
		}catch(SQLException e){
			Messagebox.show("Error en la sentencia SQL en consultarMapa", "Error",
                Messagebox.OK, Messagebox.ERROR);
            e.printStackTrace();
		}
	cerrarConexion();	
	
	ifMapa.setSrc("mapa.html?x=" + x_edf + "&" + "y=" + y_edf + "&nom=" + nomEdificio + "#top");
	//imgEdf.setSrc(consultaImagen(idEdf));
}

private String consultaImagen(int idEdf){
	String rutaImagen;
	
	conectar();
	try{
		Statement stm = conx.con.createStatement();
		ResultSet rst = stm.executeQuery("SELECT ei.fotografia FROM edificio_info ei " +
					"WHERE ei.id_edificio = " + idEdf);
		while(rst.next()){
			rutaImagen = (String)rst.getString("fotografia");
		} 
	}catch(SQLException e){
		Messagebox.show("Error en la sentencia SQL en consultaImagen", "Error",
			Messagebox.OK, Messagebox.ERROR);
			e.printStackTrace();
	}	
	cerrarConexion();
	//Messagebox.show(rutaImagen, "Error", Messagebox.OK, Messagebox.ERROR);
	return rutaImagen;
}



private void conectar(){
     conx = new ConexionDB();
}
    
private void cerrarConexion(){
    conx.cerrarConexion();
}
