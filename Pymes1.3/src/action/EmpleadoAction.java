package action;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.EmpleadoService;
import utils.Constantes;
import interfaces.*;
import beans.EmpleadoDTO;
import beans.SucursalDTO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
@ParentPackage("pit")
public class EmpleadoAction extends ActionSupport{
	private List<EmpleadoDTO> listaEmpleado;
	private List<SucursalDTO> listaSucursal;
	private EmpleadoDTO empleado;
	
	
	//@Action(value="/listaSucursal",results={@Result(name="ok",type="json")})
	@Action(value="/listaSucursal",results={@Result(name="ok",location="/addEmpleado.jsp")})
	public String listaSucursal(){
		listaSucursal=new EmpleadoService().listaSucursal();
		return "ok";
	}
	@Action(value="/listarEmpleado",results={@Result(name="ok",location="/listEmpleado.jsp")})
	public String listarEmpleado(){
		listar();
		return "ok";
	}
	@Action(value="/registrarEmpleado",results={@Result(name="ok",location="/listEmpleado.jsp")})
	public String registrarEmpleado() throws IOException{
		File f=empleado.getFoto();
		empleado.setFotoBytes(Constantes.getBytesFromFile(f));
		new EmpleadoService().registraEmpleado(empleado);
		listar();
		return "ok";
	}
	@Action(value="/actualizarEmpleado",results={@Result(name="ok",location="/listEmpleado.jsp")})
	public String actualizarEmpleado() throws IOException{
		File f=empleado.getFoto();
		empleado.setFotoBytes(Constantes.getBytesFromFile(f));
		new EmpleadoService().actualizarEmpleado(empleado);
		listar();
		return "ok";
	}	
	@Action(value="/eliminarEmpleado",results={@Result(name="eliminar",location="/listEmpleado.jsp")})
	public String eliminarEmpleado(){
		new EmpleadoService().eliminarEmpleado(empleado.getCodigo());
		listar();
		return "eliminar";
	}
	@Action(value="/buscarEmpleado",results={@Result(name="ok",location="/findEmpleado.jsp")})
	public String buscarEmpleado(){
		listaSucursal=new EmpleadoService().listaSucursal();
		empleado=new EmpleadoService().buscarEmpleado(empleado.getCodigo());
		return "ok";
	}
	void listar(){
		listaEmpleado=new EmpleadoService().listaEmpleado();
	}
	
	
	
	
	public List<EmpleadoDTO> getListaEmpleado() {
		return listaEmpleado;
	}
	public void setListaEmpleado(List<EmpleadoDTO> listaEmpleado) {
		this.listaEmpleado = listaEmpleado;
	}
	public List<SucursalDTO> getListaSucursal() {
		return listaSucursal;
	}
	public void setListaSucursal(List<SucursalDTO> listaSucursal) {
		this.listaSucursal = listaSucursal;
	}
	public EmpleadoDTO getEmpleado() {
		return empleado;
	}
	public void setEmpleado(EmpleadoDTO empleado) {
		this.empleado = empleado;
	}
	
	
	
}

