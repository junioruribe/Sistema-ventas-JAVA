
package Modelo;
import Modelo.entidades.Detalle;
import Modelo.entidades.Producto;
import Modelo.entidades.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {
    private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;

    public VentaDAO() {
    }
    
    public String getNroFactura() throws Exception{
        int max;
        String nroFac;
        con = Conectar.open();
        pst = con.prepareStatement("{call spmaxIdVenta()}");
        rs=pst.executeQuery();
        rs.next();
        max=rs.getInt(1);
        if (max<10) {
            nroFac="0000"+max;
        } else if(max>=10 && max<100) {
            nroFac="000"+max;
        } else if(max>=100 && max<999) {
            nroFac="00"+max;
        } else if(max>=1000 && max<9999) {
            nroFac="0"+max;
        }else{
            nroFac=String.valueOf(max);
        }
        return nroFac;
    }
    
    public String registrarVenta(Venta objVenta) throws Exception{
        con = Conectar.open();
        pst = con.prepareStatement("{call spRegistrarVenta(?,?,?,?,?)}");
        pst.setString(1, objVenta.getIdCliente());
        pst.setString(2, objVenta.getDni());
        pst.setString(3, objVenta.getFecha());
        pst.setDouble(4, objVenta.getTotal());
        pst.setString(5, objVenta.getEstado());
        int rta=pst.executeUpdate();
        if (rta==1) {
            pst=null;
            pst=con.prepareStatement("{call spRegistrarDetalle(?,?,?,?,?)}");
            for (Detalle detalle : objVenta.getListaDetalle()) {
                pst.setInt(1, detalle.getIdVenta());
                pst.setInt(2, detalle.getIdProducto());
                pst.setInt(3, detalle.getCantidad());
                pst.setDouble(4, detalle.getTotal());
                pst.setDouble(5, detalle.getPorDescuento());
                pst.addBatch();
            }
            int v[]= pst.executeBatch();
            rta=v.length;
        }
        return String.valueOf(rta)+"Productos Registrados";
    }
    public Venta buscarVenta(int idVenta) throws Exception{
        con = Conectar.open();
        pst = con.prepareStatement("{call spBuscarVenta(?)}");
        pst.setInt(1, idVenta);
        rs=pst.executeQuery();
        rs.next();
        Venta objVenta= new Venta();
        objVenta.setIdVenta(rs.getInt("IdVenta"));
        objVenta.setIdCliente(rs.getString("IdCliente"));
        objVenta.setDni(rs.getString("DNI"));
        objVenta.setFecha(rs.getString("Fecha"));
        objVenta.setEstado(rs.getString("Estado"));
        List<Detalle>lista=new ArrayList();
        Detalle objDetalle;
        do {            
            objDetalle=new Detalle();
            objDetalle.setIdVenta(rs.getInt("IdVenta"));
            objDetalle.setIdProducto(rs.getInt("IdProducto"));
            objDetalle.setNombre(rs.getString("Nombre"));
            objDetalle.setCantidad(rs.getInt("Cantidad"));
            objDetalle.setPrecio(rs.getInt("Valor"));
            objDetalle.setPorDescuento(rs.getDouble("Descuento"));
            lista.add(objDetalle);
        } while (rs.next());
        objVenta.setListaDetalle(lista);
            return objVenta;
        } 
}
