package service;
import java.util.List;

import beans.EmpleadoDTO;
import beans.SucursalDTO;
import interfaces.EmpleadoDAO;
import interfaces.SucursalDAO;
import utils.Constantes;
import dao.DAOFactory;
public class EmpleadoService {
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	EmpleadoDAO objEmp=fabrica.getEmpleadoDAO();
	SucursalDAO objSuc=fabrica.getSucursalDAO();
	public int registraEmpleado(EmpleadoDTO obj) {
		return objEmp.registrarEmpleado(obj);
	}
	public List<SucursalDTO> listaSucursal() {
		return objSuc.listarSucursal();
	}
	public List<EmpleadoDTO> listaEmpleado() {
		return objEmp.listarEmpleado();
	}
	public int eliminarEmpleado(int cod){
		return objEmp.eliminarEmpleado(cod);
	}
	public int actualizarEmpleado(EmpleadoDTO obj) {
		return objEmp.actualizarEmpleado(obj);
	}
	public EmpleadoDTO buscarEmpleado(int cod) {
		return objEmp.buscarEmpleado(cod);
	}
	public EmpleadoDTO fotoEmpleado(int cod) {
		return objEmp.fotoEmpleado(cod);
	}
}

