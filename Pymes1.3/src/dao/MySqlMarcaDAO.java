package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import beans.MarcaDTO;
import interfaces.MarcaDAO;

public class MySqlMarcaDAO implements MarcaDAO {
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
	public List<MarcaDTO> listMarca() {
		SqlSession session = sqlMapper.openSession();
		List<MarcaDTO>  lista  = null;
		try {
			lista = session.selectList("idListaMarca");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return lista;
	}

}
