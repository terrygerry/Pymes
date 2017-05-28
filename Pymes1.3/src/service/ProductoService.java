package service;
import java.util.List;

import beans.CategoriaDTO;
import beans.ClienteDTO;
import beans.EmpleadoDTO;
import beans.MarcaDTO;
import beans.SucursalDTO;
import interfaces.CategoriaDAO;
import interfaces.ClienteDAO;
import interfaces.EmpleadoDAO;
import interfaces.MarcaDAO;
import interfaces.SucursalDAO;
import utils.Constantes;
import dao.DAOFactory;
public class ProductoService {
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	MarcaDAO objMarca=fabrica.getMarcaDAO();
	CategoriaDAO objCategoria=fabrica.getCategoriaDAO();
	public List<MarcaDTO> listarMarca() {
		return objMarca.listMarca();
	}
	public List<CategoriaDTO> listarCategoriaXMarca(int marca) {
		return objCategoria.listCategoriaXMarca(marca);
	}
}
