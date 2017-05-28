package interfaces;

import java.util.List;

import beans.CursoDTO;

public interface CursoDAO {
	public List<CursoDTO> listarCurso(int codPro,String codAula);
}
