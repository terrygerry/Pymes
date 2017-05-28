package service;
import interfaces.EmpleadoDAO;
import interfaces.UsuarioDAO;
import java.util.List;
import beans.EnlaceDTO;
import beans.UsuarioDTO;
import utils.Constantes;
import dao.DAOFactory;
public class UsuarioService {
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	UsuarioDAO daoUsuario=fabrica.getUsuarioDAO();
	public UsuarioDTO login(UsuarioDTO bean){
		return daoUsuario.login(bean);
	}
	public List<EnlaceDTO> traerEnlacesDeUsuario(int idOperario){
		return daoUsuario.traerEnlacesDeUsuario(idOperario);

	}
}

