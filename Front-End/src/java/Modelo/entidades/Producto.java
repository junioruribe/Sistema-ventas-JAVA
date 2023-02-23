package Modelo.entidades;

public class Producto {

    private int idProducto;
    private String nombre;
    private int precio;
    private double descuento;
    private int stock;
    private Boolean estado;

    public Producto() {
    }

    public Producto(int idProducto, String nombre, int precio, double descuento, int stock, Boolean estado) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.descuento = descuento;
        this.stock = stock;
        this.estado = estado;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
    
    

}
