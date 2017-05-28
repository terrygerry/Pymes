package service;
import java.util.List;
import beans.AulaDTO;
import beans.CursoDTO;
import beans.ProfesorDTO;
import interfaces.AulaDAO;
import interfaces.CursoDAO;
import interfaces.ProfesorDAO;
import utils.Constantes;
import dao.DAOFactory;
public class ProfesorService {
	DAOFactory fabrica=DAOFactory.getDAOFactory(Constantes.ORIGEN_DATOS);
	ProfesorDAO objPro=fabrica.getProfesorDAO();
	AulaDAO objAula=fabrica.getAulaDAO();
	CursoDAO objCurso=fabrica.getCursoDAO();
	public List<ProfesorDTO> listaProfesor() {
		return objPro.listarProfesor();
	}
	public List<AulaDTO> listaAula(int cod) {
		return objAula.listarAula(cod);
	}
	public List<CursoDTO> listaCurso(int codPro, String codAula) {
		return objCurso.listarCurso(codPro, codAula);
	}
}
