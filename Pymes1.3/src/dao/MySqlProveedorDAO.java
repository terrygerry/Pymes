package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.ProveedorDTO;
import interfaces.ProveedorDAO;

public class MySqlProveedorDAO implements ProveedorDAO {

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
	public List<ProveedorDTO> listaProveedor() {
		SqlSession session = sqlMapper.openSession();
		List<ProveedorDTO> lista=null;
		try {
			lista=session.selectList("idListaProveedor");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

}
