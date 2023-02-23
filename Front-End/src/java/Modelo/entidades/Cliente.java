package Modelo.entidades;


public class Cliente {
    private String idCliente;
    private String nombre;
    private String direccion;
    private Boolean estado;

    public Cliente() {
    }

    public Cliente(String idCliente, String nombre, String direccion, Boolean estado) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.direccion = direccion;
        this.estado = estado;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Boolean getEstado() {
        return estado;
        
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    
    
    
}
