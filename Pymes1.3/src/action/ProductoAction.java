package action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.ProductoService;
import service.ProfesorService;
import beans.AulaDTO;
import beans.CategoriaDTO;
import beans.CursoDTO;
import beans.MarcaDTO;
import beans.ProductoDTO;
import beans.ProfesorDTO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@ParentPackage(value = "pit")
public class ProductoAction extends ActionSupport {
	private static final long serialVersionUID = 7968544374444173511L;
	private List<MarcaDTO> lstMarca = new ArrayList<MarcaDTO>();
	private List<CategoriaDTO> lstCategoria=new ArrayList<CategoriaDTO>();
	private ProductoDTO producto;
	private Map<String, Object> session = (Map<String, Object>)ActionContext.getContext().getSession();
	private ProductoService service = new ProductoService();
	private String marca;
	private String categoria;

		

	@Action(value = "/cargaMarca", results = { @Result(name="success",type="json") })
	public String cargaMarca() throws  Exception
	{  
		System.out.println("codigo Profesor es : "+marca);
		System.out.println("codigo Aula es : "+categoria);
		if(session.get("objMarca") == null){
			lstMarca = service.listarMarca();
			session.put("objMarca", lstMarca);
		}else{
			lstMarca = (List<MarcaDTO>)session.get("objMarca");
		}
	
		if(marca!= null && !marca.trim().equals("")&& !marca.trim().equals("-1")){

			lstCategoria = service.listarCategoriaXMarca(Integer.parseInt(marca));
		}
		return SUCCESS;
	}
	@Action(value = "/registrarProducto", results = { @Result(name="success",location="/addproducto.jsp")})
	public String registrarProducto() 
	{  
		producto=new ProductoDTO();
		producto.setCodMarca(Integer.parseInt(marca));
		producto.setCodCategoria(Integer.parseInt(categoria));
		System.out.println(producto);
		System.out.println(producto.getCodMarca());
		System.out.println(producto.getCodCategoria());
		return SUCCESS;
	}
	
	
	
	public List<MarcaDTO> getLstMarca() {
		return lstMarca;
	}
	public void setLstMarca(List<MarcaDTO> lstMarca) {
		this.lstMarca = lstMarca;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public List<CategoriaDTO> getLstCategoria() {
		return lstCategoria;
	}
	public void setLstCategoria(List<CategoriaDTO> lstCategoria) {
		this.lstCategoria = lstCategoria;
	}
	public ProductoDTO getProducto() {
		return producto;
	}
	public void setProducto(ProductoDTO producto) {
		this.producto = producto;
	}
	public ProductoService getService() {
		return service;
	}
	public void setService(ProductoService service) {
		this.service = service;
	}

	
	
}
