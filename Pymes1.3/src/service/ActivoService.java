package service;

import java.util.List;

import beans.ActivoDTO;
import beans.ProveedorDTO;
import dao.DAOFactory;
import interfaces.ActivoDAO;
import interfaces.ProveedorDAO;
import utils.Constantes;

public class ActivoService {
	
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	ActivoDAO objActivo=fabrica.getActivoDAO();
	ProveedorDAO objProveedor=fabrica.getProveedorDAO();
	
	public List<ProveedorDTO> listaProveedor(){
		return objProveedor.listaProveedor();
	}
	public int addActivo(ActivoDTO obj){
		return objActivo.addActivo(obj);
	}
	public List<ActivoDTO> listActivo(){
		return objActivo.listActivo();
	}
	

}
