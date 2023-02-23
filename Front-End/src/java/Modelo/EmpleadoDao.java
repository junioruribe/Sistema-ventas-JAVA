package Modelo;

import Modelo.entidades.Empleado;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDao {

    private String dni;
    private String nombre;
    private String telefono;
    private String email;
    private String usuario;
    private int password;
    private boolean estado;
    private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;

    public EmpleadoDao() {
    }

    public EmpleadoDao(String dni, String nombre, String telefono, String email, String usuario, int password, boolean estado) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.usuario = usuario;
        this.password = password;
        this.estado = estado;
    }

    public Empleado login(String user, int clave) throws SQLException {
        con = Conectar.open();
        pst = con.prepareStatement("{call spLogin(?,?)}");
        pst.setString(1, user);
        pst.setInt(2, clave);
        rs = pst.executeQuery();
        Empleado emp = null;
        while (rs.next()) {
            emp = new Empleado();
            emp.setDni(rs.getString("Id"));
            emp.setNombre(rs.getString("Nombre"));
            emp.setEmail(rs.getString("Correo"));
            emp.setUsuario(rs.getString("Usuario"));
        }
        con.close();
        return emp;

    }

    public List<Empleado> listar() throws SQLException {
        List<Empleado> lista = new ArrayList();
        con = Conectar.open();
        pst = con.prepareStatement("{call spListar()}");
        rs = pst.executeQuery();
        while (rs.next()) {
            Empleado emp = new Empleado();
            emp.setDni(rs.getString("Id"));
            emp.setNombre(rs.getString("Nombre"));
            emp.setTelefono(rs.getString("Telefono"));
            emp.setEmail(rs.getString("Correo"));
            emp.setUsuario(rs.getString("Usuario"));
            emp.setEstado(rs.getBoolean("Estado"));
            lista.add(emp);
        }
        con.close();
        return lista;
    }

    public int guardar(Empleado emp) throws Exception {
        int rta;
        con = Conectar.open();
        pst = con.prepareStatement("{call spAgregar(?,?,?,?,?,?,?)}");
        pst.setString(1, emp.getDni());
        pst.setString(2, emp.getNombre());
        pst.setString(4, emp.getTelefono());
        pst.setString(3, emp.getEmail());
        pst.setString(5, emp.getUsuario());
        pst.setInt(6, emp.getPassword());
        pst.setBoolean(7, emp.isEstado());
        rta = pst.executeUpdate();
        return rta;

    }

    public Empleado buscar(String dni) throws SQLException {
        con = Conectar.open();
        pst = con.prepareStatement("{call spbuscar(?)}");
        pst.setString(1, dni);
        rs = pst.executeQuery();
        Empleado emp = null;
        while (rs.next()) {
            emp = new Empleado();
            emp.setDni(rs.getString("Id"));
            emp.setNombre(rs.getString("Nombre"));
            emp.setTelefono(rs.getString("Telefono"));
            emp.setEmail(rs.getString("Correo"));
            emp.setUsuario(rs.getString("Usuario"));
            emp.setEstado(rs.getBoolean("Estado"));
        }
        con.close();
        return emp;
    }

    public int actualizar(Empleado emp) throws Exception {
        con = Conectar.open();
        int rta;
        pst = con.prepareStatement("{call spActualizar(?,?,?,?,?,?)}");
        pst.setString(1, emp.getDni());
        pst.setString(2, emp.getNombre());
        pst.setString(4, emp.getEmail());
        pst.setString(3, emp.getTelefono());
        pst.setBoolean(5, emp.isEstado());
        pst.setString(6, emp.getUsuario());
        rta = pst.executeUpdate();
        return rta;
    }
    
    public int eliminar(String dni) throws Exception {
        Empleado emp = null;
        int eli;
        con = Conectar.open();
        pst = con.prepareStatement("{call spEliminar(?)}");
        pst.setString(1, dni);
        eli = pst.executeUpdate();
        con.close();
        return eli;

    }

}
