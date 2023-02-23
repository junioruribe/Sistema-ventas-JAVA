package Modelo;

import Modelo.entidades.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao {

    private String idCliente;
    private String nombre;
    private String direccion;
    private Boolean estado;
    private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;

    public ClienteDao() {
    }

    public ClienteDao(String idCliente, String nombre, String direccion, Boolean estado) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.direccion = direccion;
        this.estado = estado;
    }

    public List<Cliente> listac() throws Exception {
        List<Cliente> Lista = new ArrayList();
        con = Conectar.open();
        pst = con.prepareStatement("{ call spListarC()}");
        rs = pst.executeQuery();
        while (rs.next()) {
            Cliente cli = new Cliente();
            cli.setIdCliente(rs.getString("IdCliente"));
            cli.setNombre(rs.getString("Nombres"));
            cli.setDireccion(rs.getString("Direccion"));
            cli.setEstado(rs.getBoolean("Estado"));
            Lista.add(cli);

        }
        con.close();
        return Lista;
    }

    public int registrar(Cliente cli) throws Exception {
        int rta;
        con = Conectar.open();
        pst = con.prepareStatement("{call SpAgregarCliente(?,?,?,?)}");
        pst.setString(1, cli.getIdCliente());
        pst.setString(2, cli.getNombre());
        pst.setString(3, cli.getDireccion());
        pst.setBoolean(4, cli.getEstado());
        rta = pst.executeUpdate();
        return rta;
    }

    public Cliente buscar(String id) throws SQLException {
        con = Conectar.open();
        pst = con.prepareStatement("{call spBuscarCliente(?)}");
        pst.setString(1, id);
        rs = pst.executeQuery();
        Cliente cli = null;
        while (rs.next()) {
            cli = new Cliente();
            cli.setIdCliente(rs.getString("IdCliente"));
            cli.setNombre(rs.getString("Nombres"));
            cli.setDireccion(rs.getString("Direccion"));
            cli.setEstado(rs.getBoolean("Estado"));
        }
        con.close();
        return cli;
    }

    public int actualizar(Cliente cli) throws Exception {
        con = Conectar.open();
        int rta;
        pst = con.prepareStatement("{call spActualizarCliente(?,?,?,?)}");
        pst.setString(1, cli.getIdCliente());
        pst.setString(2, cli.getNombre());
        pst.setString(3, cli.getDireccion());
        pst.setBoolean(4, cli.getEstado());
        rta = pst.executeUpdate();
        return rta;
    }
    
      public int eliminar(String id) throws Exception {
        Cliente cli;
        int eli;
        con = Conectar.open();
        pst = con.prepareStatement("{call spEliminarCliente(?)}");
        pst.setString(1, id);
        eli = pst.executeUpdate();
        con.close();
        return eli;

    }

}
