package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.CategoriaDTO;
import beans.MarcaDTO;
import interfaces.CategoriaDAO;

public class MySqlCategoriaDAO implements CategoriaDAO {
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
	public List<CategoriaDTO> listCategoriaXMarca(int marca) {
		SqlSession session = sqlMapper.openSession();
		List<CategoriaDTO>  lista  = null;
		try {
			lista = session.selectList("idListaCategoria",marca);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return lista;
	}

}
