package action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import beans.ActivoDTO;
import beans.ProveedorDTO;
import service.ActivoService;

@ParentPackage("pit")
public class ActivoAction extends ActionSupport {
	
	private List<ActivoDTO> listaActivo;
	private List<ProveedorDTO> listaProveedor;
	private ActivoDTO activo;
	
//	@Action(value="/listaProveedor",results={@Result(name="ok",location="/Registrar_Activo.jsp")})
//	public String listaProveedor(){
//		listaProveedor=new ActivoService().listaProveedor();
//		return "ok";
//	}
	
	@Action(value="/listarActivoBus",results={@Result(name="ok",location="/Buscar_Activo.jsp")})
	public String listarActivoBus(){
		listaActivo();
		return "ok";
	}
	
	@Action(value="/listarActivo",results={@Result(name="ok",location="/Registrar_Activo.jsp")})
	public String listarActivo(){
		listaActivo();
		return "ok";
	}
	
	
	@Action(value="/registrarActivo",results={@Result(name="ok",location="/Buscar_Activo.jsp")})
	public String registraActivo() throws IOException{
		new ActivoService().addActivo(activo);
		listaActivo();
		return "ok";
	}
	
	void listaActivo(){
		listaActivo=new ActivoService().listActivo();
	}
	
	public List<ActivoDTO> getListaActivo() {
		return listaActivo;
	}



	public void setListaActivo(List<ActivoDTO> listaActivo) {
		this.listaActivo = listaActivo;
	}



	public List<ProveedorDTO> getListaProveedor() {
		return listaProveedor;
	}



	public void setListaProveedor(List<ProveedorDTO> listaProveedor) {
		this.listaProveedor = listaProveedor;
	}



	public ActivoDTO getActivo() {
		return activo;
	}



	public void setActivo(ActivoDTO activo) {
		this.activo = activo;
	}

}
