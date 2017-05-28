package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.MysqlDBConexion;
import beans.ProfesorDTO;
import interfaces.ProfesorDAO;
public class MySqlProfesorDAO implements ProfesorDAO {
	@Override
	public List<ProfesorDTO> listarProfesor() {
		List<ProfesorDTO> data=new ArrayList<ProfesorDTO>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		ProfesorDTO obj=null;
		try {
			cn=MysqlDBConexion.getConexion();
			//String sql="select  cod_pro,concat_ws(' ',ape_pat_pro,ape_mat_pro,nom_pro) from tb_profesor";
			String sql="select  cod_pro,ape_pat_pro,ape_mat_pro,nom_pro from tb_profesor";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				obj=new ProfesorDTO();
				obj.setCodigo(rs.getInt(1));
				//obj.setProfesor(rs.getString(2));
				obj.setPaterno(rs.getString(2));
				obj.setMaterno(rs.getString(3));
				obj.setNombre(rs.getString(4));
				data.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(rs!=null)rs.close();if(pstm!=null)pstm.close();if(cn!=null)cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}

}
