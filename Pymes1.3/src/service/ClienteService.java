package service;
import java.util.List;

import beans.ClienteDTO;
import beans.EmpleadoDTO;
import beans.SucursalDTO;
import interfaces.ClienteDAO;
import interfaces.EmpleadoDAO;
import interfaces.SucursalDAO;
import utils.Constantes;
import dao.DAOFactory;
public class ClienteService {
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	ClienteDAO objClie=fabrica.getClienteDAO();
	public int registraCliente(ClienteDTO obj) {
		return objClie.addCliente(obj);
	}
	
}
