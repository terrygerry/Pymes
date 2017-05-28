package action;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.swing.JOptionPane;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.tomcat.util.codec.binary.Base64;

import service.ClienteService;
import service.EmpleadoService;
import utils.Constantes;
import interfaces.*;
import beans.ClienteDTO;
import beans.EmpleadoDTO;
import beans.SucursalDTO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
@ParentPackage("pit")
public class ClienteAction extends ActionSupport{
	private ClienteDTO cliente;
	private String imagen;	
	@Action(value="/registrarCliente",results={@Result(name="ok",location="/addCliente.jsp")})
	public String registrarCliente() throws IOException{
		imagen = imagen.substring(imagen.indexOf(',') + 1, imagen.length() - 1);
		byte[] byteImagen = new Base64().decode(imagen);
		cliente.setFotoBytes(byteImagen);
		new ClienteService().registraCliente(cliente);
		return "ok";
	}
	public ClienteDTO getCliente() {
		return cliente;
	}
	public void setCliente(ClienteDTO cliente) {
		this.cliente = cliente;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}	
}

