package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utils.MysqlDBConexion;

import beans.AulaDTO;
import interfaces.AulaDAO;

public class MySqlAulaDAO implements AulaDAO {

	@Override
	public List<AulaDTO> listarAula(int cod) {
		ArrayList<AulaDTO> data=new ArrayList<AulaDTO>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		AulaDTO lec=null;
		try {
			cn=MysqlDBConexion.getConexion();//1 conexion
			String sql="select distinct(pc.cod_aula),a.des_aula from tb_profesor_curso pc inner join tb_aula a on pc.cod_aula=a.cod_aula where pc.cod_pro=?";
				pstm=cn.prepareStatement(sql);//3 indicar sentencia SQL al objeto pstm
				pstm.setInt(1, cod);
				rs=pstm.executeQuery();//4 ejecutar sentencia y almacenarlo en el objeto rs
				while(rs.next()){
					lec=new AulaDTO();
					lec.setCodigo(rs.getString(1));
					lec.setDescripcion(rs.getString(2));;
					data.add(lec);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();if(pstm!=null)pstm.close();if(cn!=null)cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}

}
