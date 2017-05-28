package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import beans.ActivoDTO;
import interfaces.ActivoDAO;

public class MySqlActivoDAO implements ActivoDAO {

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
	public int addActivo(ActivoDTO obj) {
		int estado=1;
		SqlSession session=sqlMapper.openSession();
		try {
			estado=session.insert("idInsertaActivo",obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		return estado;
	}

	@Override
	public int updateActivo(ActivoDTO obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteActivo(int cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ActivoDTO> listActivo() {
		SqlSession session = sqlMapper.openSession();
		List<ActivoDTO> lista=null;
		try {
			lista=session.selectList("idListaActivo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public ActivoDTO findActivo(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

}
