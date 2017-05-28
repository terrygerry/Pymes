package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.MysqlDBConexion;
import beans.CursoDTO;
import interfaces.CursoDAO;
public class MySqlCursoDAO implements CursoDAO {

	@Override
	public List<CursoDTO> listarCurso(int codPro, String codAula) {
		ArrayList<CursoDTO> data=new ArrayList<CursoDTO>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		CursoDTO lec=null;
		try {
			cn=MysqlDBConexion.getConexion();//1 conexion
			String sql="select pc.cod_cur,c.des_cur from tb_profesor_curso pc inner join tb_curso c on pc.cod_cur=c.cod_cur where pc.cod_pro=? and pc.cod_aula=?";
				pstm=cn.prepareStatement(sql);//3 indicar sentencia SQL al objeto pstm
				pstm.setInt(1, codPro);
				pstm.setString(2, codAula);
				rs=pstm.executeQuery();//4 ejecutar sentencia y almacenarlo en el objeto rs
				while(rs.next()){
					lec=new CursoDTO();
					lec.setCodigo(rs.getString(1));
					lec.setNombre(rs.getString(2));;
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
