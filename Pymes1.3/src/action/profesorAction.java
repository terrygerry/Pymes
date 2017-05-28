package action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.ProfesorService;
import beans.AulaDTO;
import beans.CursoDTO;
import beans.ProfesorDTO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@ParentPackage(value = "pit")
public class profesorAction extends ActionSupport {
	private static final long serialVersionUID = 7968544374444173511L;
	private List<ProfesorDTO> lstProfesor = new ArrayList<ProfesorDTO>();
	private List<AulaDTO> lstAula=new ArrayList<AulaDTO>();
	private List<CursoDTO> lstCurso=new ArrayList<CursoDTO>();
	
	private Map<String, Object> session = (Map<String, Object>)ActionContext.getContext().getSession();
	private ProfesorService service = new ProfesorService();
	
	private String profesor;
	private String aula;
	private String curso;

	

	private boolean escape = true;

	

	
	@SuppressWarnings("unchecked")
	@Action(value = "/cargaProfesor", results = { @Result(name="success",type="json") })
	public String cargaProfesor() throws  Exception
	{  
		System.out.println("codigo Profesor es : "+profesor);
		System.out.println("codigo Aula es : "+aula);
		if(session.get("objProfesores") == null){
			lstProfesor = service.listaProfesor();
			session.put("objProfesores", lstProfesor);
		}else{
			lstProfesor = (List<ProfesorDTO>)session.get("objProfesores");
		}
	
		if(profesor!= null && !profesor.trim().equals("")&& !profesor.trim().equals("-1")){

			lstAula = service.listaAula(Integer.parseInt(profesor));	
		}
		
		if(profesor!= null && aula!= null && !profesor.trim().equals("") && !aula.trim().equals("")&& !profesor.trim().equals("-1") && !aula.trim().equals("-1")){
			lstCurso = service.listaCurso(Integer.parseInt(profesor), aula);
		}
		

		return SUCCESS;
	}




	public List<ProfesorDTO> getLstProfesor() {
		return lstProfesor;
	}




	public void setLstProfesor(List<ProfesorDTO> lstProfesor) {
		this.lstProfesor = lstProfesor;
	}




	public Map<String, Object> getSession() {
		return session;
	}




	public void setSession(Map<String, Object> session) {
		this.session = session;
	}




	public ProfesorService getService() {
		return service;
	}




	public void setService(ProfesorService service) {
		this.service = service;
	}




	public String getProfesor() {
		return profesor;
	}




	public void setProfesor(String profesor) {
		this.profesor = profesor;
	}




	public String getAula() {
		return aula;
	}




	public void setAula(String aula) {
		this.aula = aula;
	}




	public String getCurso() {
		return curso;
	}




	public void setCurso(String curso) {
		this.curso = curso;
	}




	public boolean isEscape() {
		return escape;
	}




	public void setEscape(boolean escape) {
		this.escape = escape;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	public List<AulaDTO> getLstAula() {
		return lstAula;
	}




	public void setLstAula(List<AulaDTO> lstAula) {
		this.lstAula = lstAula;
	}




	public List<CursoDTO> getLstCurso() {
		return lstCurso;
	}




	public void setLstCurso(List<CursoDTO> lstCurso) {
		this.lstCurso = lstCurso;
	}
	
	
	


}
