package interfaces;

import java.util.List;

import beans.ActivoDTO;

public interface ActivoDAO {
	
	public int addActivo(ActivoDTO obj);
	public int updateActivo(ActivoDTO obj);
	public int deleteActivo(int cod);
	public List<ActivoDTO> listActivo();
	public ActivoDTO findActivo(int cod);

}
