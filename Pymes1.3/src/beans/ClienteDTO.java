package beans;
import java.io.File;
public class ClienteDTO {
	private int codigo;
	private String nombre;
	private String apellido;
	private File Foto;
	private byte[] FotoBytes;
	private String FotoContentType;
	private String FotoFileName;
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public File getFoto() {
		return Foto;
	}
	public void setFoto(File foto) {
		Foto = foto;
	}
	public byte[] getFotoBytes() {
		return FotoBytes;
	}
	public void setFotoBytes(byte[] fotoBytes) {
		FotoBytes = fotoBytes;
	}
	public String getFotoContentType() {
		return FotoContentType;
	}
	public void setFotoContentType(String fotoContentType) {
		FotoContentType = fotoContentType;
	}
	public String getFotoFileName() {
		return FotoFileName;
	}
	public void setFotoFileName(String fotoFileName) {
		FotoFileName = fotoFileName;
	}
}

