package interfaces;
import java.util.List;
import beans.EnlaceDTO;
import beans.UsuarioDTO;
public interface UsuarioDAO {
	public UsuarioDTO  login(UsuarioDTO bean);
	public abstract List<EnlaceDTO> 
		traerEnlacesDeUsuario(int idUsuario);
}


