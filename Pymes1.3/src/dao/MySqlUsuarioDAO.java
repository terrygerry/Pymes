package dao;
import interfaces.UsuarioDAO;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import beans.EnlaceDTO;
import beans.UsuarioDTO;
public class MySqlUsuarioDAO implements UsuarioDAO {
	SqlSessionFactory sqlMapper = null;
	{	String archivo = "ConfiguracionIbatis.xml";
		try {
			Reader reader = Resources.getResourceAsReader(archivo);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public UsuarioDTO login(UsuarioDTO bean){
		SqlSession session = sqlMapper.openSession();
		UsuarioDTO obj = null;
		try {
			obj = (UsuarioDTO) session.selectOne("SQL_login", bean);
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<EnlaceDTO> traerEnlacesDeUsuario(int idUsuario){
		SqlSession session = sqlMapper.openSession();
		List lista = new ArrayList<EnlaceDTO>();
		try {
			lista = session.selectList("SQL_traerEnlacesDeUsuario", idUsuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
}


