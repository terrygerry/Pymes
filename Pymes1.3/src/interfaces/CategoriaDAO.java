package interfaces;

import java.util.List;

import beans.CategoriaDTO;

public interface CategoriaDAO {
	public List<CategoriaDTO> listCategoriaXMarca(int marca);
	
	
}
