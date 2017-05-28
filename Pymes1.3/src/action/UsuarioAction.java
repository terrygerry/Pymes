package action;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import org.apache.struts2.dispatcher.SessionMap;
import service.UsuarioService;
import beans.EnlaceDTO;
import beans.UsuarioDTO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@ParentPackage("pit")
public class UsuarioAction extends ActionSupport {
	
	private UsuarioService service = new UsuarioService();
	private Map<String, Object> session = (Map<String, Object>)ActionContext.getContext().getSession();
	private String usuario;
	private String clave;
	@Action(value = "/login", results = { @Result(location = "/index.jsp", name = "success"),
										  @Result(location = "/login.jsp", name = "error")})
	public String login(){
		UsuarioDTO bean = new UsuarioDTO();
		bean.setLogin(usuario);
		bean.setPassword(clave);
		UsuarioDTO usu =  service.login(bean);
			if(usu == null){
				return  "error";
			}else{
				//Traemos los permisos
				List<EnlaceDTO> enlaces =service.traerEnlacesDeUsuario(usu.getIdUsuario());
				//guardamos en sesion el usuario y los permisos
				session.put("objUsuario",usu);
				session.put("objUsuarioMenus",enlaces);
				return  "success";
			}
	}
	@Action(value = "/logout", results = {@Result(location = "/login.jsp", name = "success")})
	public String logout(){
		SessionMap sessionActual = (SessionMap)ActionContext.getContext().getSession();
		sessionActual.invalidate();
		return SUCCESS;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
}
