
package Modelo.entidades;

import java.util.List;


public class Venta {
    private int idVenta;
    private String idCliente;
    private String dni;
    private String fecha;
    private double total;
    private String estado;
    private List<Detalle>listaDetalle;
    private String nombre;
    public Venta() {
    }

    public Venta(int idVenta, String idCliente, String dni, String fecha, double total, String estado) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.dni = dni;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    public Venta(int idVenta, String idCliente, String dni, String fecha, double total, String estado, List<Detalle> listaDetalle) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.dni = dni;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
        this.listaDetalle = listaDetalle;
    }

    public Venta(String nombre) {
        this.nombre = nombre;
    }

    public void setListaDetalle(List<Detalle> listaDetalle) {
        this.listaDetalle = listaDetalle;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public String getDni() {
        return dni;
    }

    public String getFecha() {
        return fecha;
    }

    public double getTotal() {
        return total;
    }

    public String getEstado() {
        return estado;
    }

    public List<Detalle> getListaDetalle() {
        return listaDetalle;
    }
    
}
