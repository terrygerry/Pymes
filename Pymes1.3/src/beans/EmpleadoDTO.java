package beans;

import java.io.File;

public class EmpleadoDTO {
	private int codigo;
	private String nombre;
	private String apellido;
	private String sexo;
	private int dni;
	private String cargo;
	private String fechaNacimiento;
	private String fechaRegistro;
	private int codSucursal;
	private String nomSucursal;
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
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public int getDni() {
		return dni;
	}
	public void setDni(int dni) {
		this.dni = dni;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public int getCodSucursal() {
		return codSucursal;
	}
	public void setCodSucursal(int codSucursal) {
		this.codSucursal = codSucursal;
	}
	public String getNomSucursal() {
		return nomSucursal;
	}
	public void setNomSucursal(String nomSucursal) {
		this.nomSucursal = nomSucursal;
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
