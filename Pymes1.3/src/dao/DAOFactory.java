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

public abstract class DAOFactory {
	// los posibles orígenes de datos
    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;
    // Existirá un método get por cada DAO que exista en el sistema
    // Ejemplo:
    //public abstract ArticuloDAO getArticuloDAO();
    // registramos nuestros daos
    public abstract SucursalDAO getSucursalDAO();
    public abstract EmpleadoDAO getEmpleadoDAO();
    public abstract ClienteDAO getClienteDAO();
    public abstract UsuarioDAO getUsuarioDAO();
    public abstract ProfesorDAO getProfesorDAO();
    public abstract AulaDAO getAulaDAO();
    public abstract CursoDAO getCursoDAO();
    public abstract MarcaDAO getMarcaDAO();
    public abstract CategoriaDAO getCategoriaDAO();
    
    public abstract ActivoDAO getActivoDAO();
    public abstract ProveedorDAO getProveedorDAO();
    
    
    public static DAOFactory getDAOFactory(int whichFactory){
        switch(whichFactory){
       	case MYSQL:
        	   return new MySqlDAOFactory();
        	case XML:
        	    //return new XmlDAOFactory();
        	case ORACLE:
        	    //return new OracleDAOFactory();
        	/*case DB2:
        	    return new Db2DAOFactory();
        	case SQLSERVER:
        	    return new SqlServerDAOFactory();
        	case XML:
        	    return new XmlDAOFactory();*/
        	default:
        	    return null;
        }
     }
}
