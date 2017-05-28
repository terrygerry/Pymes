package dao;
import interfaces.ActivoDAO;
import interfaces.AulaDAO;
import interfaces.CategoriaDAO;
import interfaces.ClienteDAO;
import interfaces.CursoDAO;
import interfaces.EmpleadoDAO;
import interfaces.MarcaDAO;
import interfaces.ProfesorDAO;
import interfaces.ProveedorDAO;
import interfaces.SucursalDAO;
import interfaces.UsuarioDAO;
public class MySqlDAOFactory extends DAOFactory {
	@Override
	public SucursalDAO getSucursalDAO() {
		// TODO Auto-generated method stub
		return new MySqlSucursalDAO();
	}
	@Override
	public EmpleadoDAO getEmpleadoDAO() {
		// TODO Auto-generated method stub
		return new MySqlEmpleadoDAO();
	}
	@Override
	public ClienteDAO getClienteDAO() {
		// TODO Auto-generated method stub
		return new MySqlClienteDAO();
	}
	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDAO();
	}
	@Override
	public ProfesorDAO getProfesorDAO() {
		// TODO Auto-generated method stub
		return new MySqlProfesorDAO();
	}

	@Override
	public AulaDAO getAulaDAO() {
		// TODO Auto-generated method stub
		return new MySqlAulaDAO();
	}

	@Override
	public CursoDAO getCursoDAO() {
		// TODO Auto-generated method stub
		return new MySqlCursoDAO();
	}
	@Override
	public MarcaDAO getMarcaDAO() {
		// TODO Auto-generated method stub
		return new MySqlMarcaDAO();
	}
	@Override
	public CategoriaDAO getCategoriaDAO() {
		// TODO Auto-generated method stub
		return new MySqlCategoriaDAO();
	}
	@Override
	public ActivoDAO getActivoDAO() {
		// TODO Auto-generated method stub
		return new MySqlActivoDAO();
	}
	@Override
	public ProveedorDAO getProveedorDAO() {
		// TODO Auto-generated method stub
		return new MySqlProveedorDAO();
	}
}

