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
import interfaces.EmpleadoDAO;
public class MySqlEmpleadoDAO implements EmpleadoDAO {
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
	public int registrarEmpleado(EmpleadoDTO obj) {
		int estado=-1;
		SqlSession session = sqlMapper.openSession();
		try {
			estado = session.insert("idInsertaEmpleado", obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return estado;
	}
	@Override
	public List<EmpleadoDTO> listarEmpleado() {
		SqlSession session = sqlMapper.openSession();
		List<EmpleadoDTO>  lista  = null;
		try {
			lista = session.selectList("idListaEmpleado");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return lista;
	}	
	@Override
	public int actualizarEmpleado(EmpleadoDTO obj) {
		int estado=-1;
		SqlSession session = sqlMapper.openSession();
		try {
			estado = session.insert("idActualizaEmpleado", obj);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return estado;
	}
	@Override
	public int eliminarEmpleado(int cod) {
		int estado=-1;
		SqlSession session = sqlMapper.openSession();
		try {
			estado = session.insert("idEliminaEmpleado", cod);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally{
			session.close();
		}
		return estado;
	}
	@Override
	public EmpleadoDTO buscarEmpleado(int cod) {
		SqlSession session = sqlMapper.openSession();
		EmpleadoDTO  lista  = null;
		try {
			lista = (EmpleadoDTO)session.selectOne("idBuscarEmpleado",cod);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return lista;
	}
	@Override
	public EmpleadoDTO fotoEmpleado(int cod) {
		SqlSession session = sqlMapper.openSession();
		EmpleadoDTO  emp  = null;
		try {
			emp = (EmpleadoDTO)session.selectOne("idObtieneEmpleado",cod);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		return emp;
	}
}

