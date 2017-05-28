package dao;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import utils.MysqlDBConexion;
import beans.EmpleadoDTO;
import beans.SucursalDTO;
import interfaces.SucursalDAO;
public class MySqlSucursalDAO implements SucursalDAO {
	SqlSessionFactory sqlMapper = null;
	{
		String archivo = "ConfiguracionIbatis.xml";
		try {
			Reader reader = Resources.getResourceAsReader(archivo);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	@Override
	public List<SucursalDTO> listarSucursal() {
		SqlSession session = sqlMapper.openSession();
		List<SucursalDTO>  lista  = null;
		try {
			lista = session.selectList("idListaSucursal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return lista;
	}	
}


