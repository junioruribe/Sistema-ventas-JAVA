
package Modelo.entidades;

public class Detalle {
 private int idVenta;
 private int idProducto;
 private String nombre;
 private int precio;
 private int  cantidad;
 private double porDescuento;
 private double vrDescuento;
 private double subTotal;
 private double desc;
 private double total;



public Detalle(){
    
} 

    public Detalle(int idVenta, int idProducto, String nombre, int precio, int cantidad, double porDescuento, double vrDescuento, double subTotal, double desc, double total) {
        this.idVenta = idVenta;
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
        this.porDescuento = porDescuento;
        this.vrDescuento = vrDescuento;
        this.subTotal = subTotal;
        this.desc = desc;
        this.total = total;
    }



    public Detalle(String nombre) {
        this.nombre = nombre;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPorDescuento() {
        return porDescuento;
    }

    public void setPorDescuento(double porDescuento) {
        this.porDescuento = porDescuento;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getDesc() {
        return desc;
    }

    public void setDesc(double desc) {
        this.desc = desc;
    }

    public double getVrDescuento() {
        return vrDescuento;
    }

    public void setVrDescuento(double vrDescuento) {
        this.vrDescuento = vrDescuento;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }


}
 