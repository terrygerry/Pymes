package action;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import service.EmpleadoService;
import beans.EmpleadoDTO;
import com.opensymphony.xwork2.ActionSupport;
@ParentPackage(value = "pit")
public class ImagenAction extends ActionSupport {
	private InputStream foto;
	private int idCodigo;
	//type="stream" --> Se envia un trama de bytes
	//"inputName","imagenData" -->El objeto que tiene la trama de bytes
	@Action(value = "verFoto",results={@Result(
							params={"inputName","foto"}, 
							name = "success", type="stream")})
	public String verFoto() throws Exception {
		try {
			EmpleadoDTO bean =  new EmpleadoService().fotoEmpleado(idCodigo);	
			foto= new ByteArrayInputStream(bean.getFotoBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public InputStream getFoto() {
		return foto;
	}
	public void setFoto(InputStream foto) {
		this.foto = foto;
	}
	public int getIdCodigo() {
		return idCodigo;
	}
	public void setIdCodigo(int idCodigo) {
		this.idCodigo = idCodigo;
	}
}

