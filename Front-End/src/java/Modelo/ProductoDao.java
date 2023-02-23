package Modelo;

import Modelo.entidades.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {

    int idProducto;
    String nombre;
    int precio;
    double descuento;
    int stock;
    Boolean estado;
    private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductoDao() {
    }

    public ProductoDao(int idProducto, String nombre, int precio, double descuento, int stock, Boolean estado) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.descuento = descuento;
        this.stock = stock;
        this.estado = estado;
    }

    public List<Producto> listarpro() throws Exception {
        List<Producto> Lista = new ArrayList();
        con = Conectar.open();
        pst = con.prepareStatement("{ call spListarProducto()}");
        rs = pst.executeQuery();
        while (rs.next()) {
            Producto pro = new Producto();
            pro.setIdProducto(rs.getInt("IdProducto"));
            pro.setNombre(rs.getString("Nombre"));
            pro.setPrecio(rs.getInt("Precio"));
            pro.setDescuento(rs.getDouble("Descuento"));
            pro.setStock(rs.getInt("Stock"));
            pro.setEstado(rs.getBoolean("Estado"));
            Lista.add(pro);
        }
        con.close();
        return Lista;
    }

    public int registrar(Producto pro) throws Exception {
        int rta;
        con = Conectar.open();
        pst = con.prepareStatement("{call spAgregarProducto(?,?,?,?,?,?)}");
        pst.setInt(1, pro.getIdProducto());
        pst.setString(2, pro.getNombre());
        pst.setInt(3, pro.getPrecio());
        pst.setDouble(4, pro.getDescuento());
        pst.setInt(5, pro.getStock());
        pst.setBoolean(6, pro.getEstado());
        rta = pst.executeUpdate();
        return rta;
    }

    public Producto buscar(int id) throws SQLException {
        con = Conectar.open();
        pst = con.prepareStatement("{call spBuscarProducto(?)}");
        pst.setInt(1, id);
        rs = pst.executeQuery();
        Producto pro = null;
        while (rs.next()) {
            pro = new Producto();
            pro.setIdProducto(rs.getInt("IdProducto"));
            pro.setNombre(rs.getString("Nombre"));
            pro.setPrecio(rs.getInt("Precio"));
            pro.setDescuento(rs.getDouble("Descuento"));
            pro.setStock(rs.getInt("Stock"));
            pro.setEstado(rs.getBoolean("Estado"));

        }
        con.close();
        return pro;
    }

    public int actualizar(Producto pro) throws Exception {
        con = Conectar.open();
        int rta;
        pst = con.prepareStatement("{call spActualizarProducto(?,?,?,?,?,?)}");
        pst.setInt(1, pro.getIdProducto());
        pst.setString(2, pro.getNombre());
        pst.setInt(3, pro.getPrecio());
        pst.setDouble(4, pro.getDescuento());
        pst.setInt(5, pro.getStock());
        pst.setBoolean(6, pro.getEstado());
        rta = pst.executeUpdate();
        return rta;
    }

    public int eliminar(int id) throws Exception {
        Producto pro = null;
        int eli;
        con = Conectar.open();
        pst = con.prepareStatement("{call spEliminarProducto(?)}");
        pst.setInt(1, id);
        eli = pst.executeUpdate();
        con.close();
        return eli;

    }
    

}
