package interfaces;

import java.util.List;

import beans.AulaDTO;

public interface AulaDAO {
	public List<AulaDTO>listarAula(int cod);
}
