package Control;

import Modelo.ClienteDao;
import Modelo.EmpleadoDao;
import Modelo.ProductoDao;
import Modelo.VentaDAO;
import Modelo.entidades.Cliente;
import Modelo.entidades.Empleado;
import Modelo.entidades.Producto;
import Modelo.entidades.Detalle;
import Modelo.entidades.Venta;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlar", urlPatterns = {"/Controlar"})
public class Controlar extends HttpServlet {

    String idCli;
    int idPro;
    Producto pro;
    ProductoDao proDAO;
    Empleado objEmpleado;
    Producto objPro;
    ClienteDao cliDAO;
    Cliente objCli;
    List<Detalle> lista;
    Detalle objDet;
    VentaDAO venDAO;
    String nroFac;
    double vrtotal;
    String fecha;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, Exception {
        String accion, menu;
        accion = request.getParameter("accion");
        menu = request.getParameter("menu");
        switch (menu) {
            case "Principal":
                request.getRequestDispatcher("Principal.jsp").forward(request, response);
                break;
            case "RegistrarVenta":

                switch (accion) {
                    case "Mostrar":
                        venDAO = new VentaDAO();
                        nroFac = venDAO.getNroFactura();
                        vrtotal = 0;

                        fecha = new SimpleDateFormat("yyyy/MM/dd ").format(Calendar.getInstance().getTime());
                        request.setAttribute("fecha", fecha);
                        lista = new ArrayList<>();
                        request.setAttribute("vrtotal", vrtotal);
                        request.setAttribute("nroFactura", nroFac);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        break;
                    case "BuscarCliente":
                        idCli = request.getParameter("txtCodigoCli");
                        cliDAO = new ClienteDao();
                        objCli = cliDAO.buscar(idCli);
                        //String nomCli=objCli.getNombre();
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("cliente", objCli);
                        request.setAttribute("nroFactura", nroFac);
                        request.setAttribute("vrtotal", vrtotal);
                        request.setAttribute("listaVen", lista);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        //request.getRequestDispatcher("RegistrarVenta.jsp?nom="+nomCli+"&dni="+idCli).forward(request, response);        
                        break;
                    case "BuscarProducto":
                        idPro = Integer.parseInt(request.getParameter("txtCodigoPro"));
                        proDAO = new ProductoDao();
                        pro = proDAO.buscar(idPro);
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("Producto", pro);
                        request.setAttribute("cliente", objCli);
                        request.setAttribute("listaVen", lista);
                        request.setAttribute("nroFactura", nroFac);
                        request.setAttribute("vrtotal", vrtotal);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        break;
                    case "Agregar":
                        double subtotal,
                         total,
                         vrdesc;
                        int idven;
                        idven=Integer.parseInt(nroFac);
                        int precio = Integer.parseInt(request.getParameter("txtPrecio"));
                        int cant = Integer.parseInt(request.getParameter("txtCantidad"));
                        double pordesc = Double.parseDouble(request.getParameter("txtDescuento"));
                        objDet = validar(idPro);
                        if (objDet == null) {
                            String nom = request.getParameter("txtNombrePro");
                            
                            idven = Integer.parseInt(nroFac);
                            subtotal = precio * cant;
                            vrdesc = subtotal * (pordesc / 100);
                            total = subtotal - vrdesc;
                            objDet = new Detalle(idven, idPro, nom, precio, cant, pordesc, vrdesc, subtotal, vrdesc, total);
                            lista.add(objDet);
                            vrtotal = vrtotal + total;
                        } else {
                          int index;
                          index=lista.indexOf(objDet);
                          cant = cant+objDet.getCantidad();
                          subtotal = precio * cant;
                          vrdesc = subtotal * (pordesc / 100);
                          total = subtotal - vrdesc;
                          
                          vrtotal=vrtotal-objDet.getTotal();
                          objDet.setSubTotal(subtotal);
                          objDet.setCantidad(cant);
                          objDet.setVrDescuento(vrdesc);
                          objDet.getTotal();
                          lista.set(index, objDet);
                          vrtotal = vrtotal + total;
                        }
                        
                       
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("vrtotal", vrtotal);
                        request.setAttribute("listaVen", lista);
                        request.setAttribute("nroFactura", nroFac);
                        request.setAttribute("cliente", objCli);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        break;
                    case "AgregarVenta":
                        String dni;
                        Venta objVen = new Venta();
                        objVen.setIdVenta(Integer.parseInt(nroFac));
                        objVen.setIdCliente(idCli);
                        objEmpleado = (Empleado) request.getSession().getAttribute("usuario");
                        dni = objEmpleado.getDni();
                        objVen.setDni(dni);
                        objVen.setFecha(fecha);
                        objVen.setTotal(vrtotal);
                        objVen.setEstado("Pago");
                        objVen.setListaDetalle(lista);
                        venDAO = new VentaDAO();
                        String resultado;
                        resultado = venDAO.registrarVenta(objVen);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=RegistrarVenta&accion=Mostrar").forward(request, response);
                        break;
                    case "Eliminar":
                        int idP;
                        idP = Integer.parseInt(request.getParameter("id"));
                        for (Detalle detalle : lista) {
                            if (idP == detalle.getIdProducto()) {
                                vrtotal = vrtotal - detalle.getTotal();
                                lista.remove(detalle);
                                break;
                            }
                        }
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("vrtotal", vrtotal);
                        request.setAttribute("listaVen", lista);
                        request.setAttribute("nroFactura", nroFac);
                        request.setAttribute("cliente", objCli);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        break;
                    case "Cancelar":
                        request.getRequestDispatcher("Controlar?menu=RegistrarVenta&accion=Mostrar").forward(request, response);
                        break;
                    case "Buscar":
                        double sub,
                         tot,
                         porDes,
                         vrDes;
                        int canti,
                         pre;
                        int idVen;
                        nroFac = request.getParameter("txtNroFactura");
                        venDAO = new VentaDAO();
                        idVen = Integer.parseInt(nroFac);
                        objVen = venDAO.buscarVenta(idVen);
                        lista = new ArrayList<>();
                        vrtotal = 0;
                        for (Detalle detalle : objVen.getListaDetalle()) {
                            pre = detalle.getPrecio();
                            canti = detalle.getCantidad();
                            porDes = detalle.getPorDescuento();
                            sub = (pre * canti);
                            vrDes = sub * (porDes / 100);
                            tot = sub - vrDes;
                            detalle.setSubTotal(sub);
                            detalle.setVrDescuento(vrDes);
                            detalle.setTotal(tot);
                            lista.add(detalle);
                            vrtotal += tot;
                        }
                        fecha = objVen.getFecha();
                        objCli = new Cliente();
                        objCli = new ClienteDao().buscar(objVen.getDni());
                        //objCli.setIdCliente(objVen.getIdCliente());
                        //objCli.setNombre();

                        request.setAttribute("vrtotal", vrtotal);
                        request.setAttribute("listaVen", lista);
                        request.setAttribute("nroFactura", nroFac);
                        request.setAttribute("cliente", objCli);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                        break;
                }
            case "Producto":
                switch (accion) {
                    case "ListarProducto":
                        ProductoDao proDao = new ProductoDao();
                        List<Producto> listaP;
                        listaP = proDao.listarpro();
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("listap", listaP);
                        request.getRequestDispatcher("Producto.jsp").forward(request, response);
                        break;
                    case "Agregar":
                        Producto Pro;
                        int cod = Integer.parseInt(request.getParameter("txtIdProducto"));
                        String nom = request.getParameter("txtNombre");
                        int pre = Integer.parseInt(request.getParameter("txtPrecio"));
                        Double desc = Double.parseDouble(request.getParameter("txtDescuento"));
                        int stock = Integer.parseInt(request.getParameter("txtStock"));
                        boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        Pro = new Producto(cod, nom, pre, desc, stock, esta);
                        ProductoDao objPro = new ProductoDao();
                        int rta = objPro.registrar(Pro);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Producto&accion=ListarProducto").forward(request, response);
                        break;
                    case "Guardar":
                        int id = Integer.parseInt(request.getParameter("IdProducto"));
                        Producto objpro;
                        ProductoDao ProDao = new ProductoDao();
                        objpro = ProDao.buscar(id);
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("producto", objpro);
                        request.getRequestDispatcher("Controlar?menu=Producto&accion=ListarProducto").forward(request, response);
                        break;
                    case "Actualizar":
                        Producto pro;
                        int cod1 = Integer.parseInt(request.getParameter("txtIdProducto"));
                        String nom1 = request.getParameter("txtNombre");
                        int pre1 = Integer.parseInt(request.getParameter("txtPrecio"));
                        Double desc1 = Double.parseDouble(request.getParameter("txtDescuento"));
                        int stock1 = Integer.parseInt(request.getParameter("txtStock"));
                        boolean esta1 = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        pro = new Producto(cod1, nom1, pre1, desc1, stock1, esta1);
                        ProductoDao ObjPro = new ProductoDao();
                        int rtal = ObjPro.actualizar(pro);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Producto&accion=ListarProducto").forward(request, response);
                        break;
                    case "Eliminar":
                        int IdPro;
                        int elimi;
                        IdPro = Integer.parseInt(request.getParameter("IdProducto"));
                        ProductoDao ObjDao = new ProductoDao();
                        elimi = ObjDao.eliminar(IdPro);
                        // validar elimi
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Producto&accion=ListarProducto").forward(request, response);
                        break;

                }
                break;
            case "Cliente":
                switch (accion) {
                    case "ListarCliente":
                        ClienteDao cliDao = new ClienteDao();
                        List<Cliente> listac;
                        listac = cliDao.listac();
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("listac", listac);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        break;
                    case "Agregar":
                        Cliente clien;
                        String cod = request.getParameter("txtDNI");
                        String nom = request.getParameter("txtNombre");
                        String dire = request.getParameter("txtDireccion");
                        boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        clien = new Cliente(cod, nom, dire, esta);
                        ClienteDao objDao = new ClienteDao();
                        int rta = objDao.registrar(clien);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Cliente&accion=ListarCliente").forward(request, response);
                        break;
                    case "guardar":
                        String id = request.getParameter("IdCliente");
                        Cliente objCli;
                        ClienteDao ClDao = new ClienteDao();
                        objCli = ClDao.buscar(id);
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("cliente", objCli);
                        request.getRequestDispatcher("Controlar?menu=Cliente&accion=ListarCliente").forward(request, response);
                        break;
                    case "Actualizar":
                        Cliente cli1;
                        String id1 = request.getParameter("txtDNI");
                        String nom1 = request.getParameter("txtNombre");
                        String dire1 = request.getParameter("txtDireccion");
                        Boolean esta1 = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        cli1 = new Cliente(id1, nom1, dire1, esta1);
                        ClienteDao objCli1 = new ClienteDao();
                        int rtal = objCli1.actualizar(cli1);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Cliente&accion=ListarCliente").forward(request, response);
                        break;
                    case "Eliminar":
                        String Idclien;
                        int elimi;
                        Idclien = request.getParameter("Id");
                        ClienteDao ObjDao = new ClienteDao();
                        elimi = ObjDao.eliminar(Idclien);
                        // validar elimi
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Cliente&accion=ListarCliente").forward(request, response);
                        break;
                }
                break;
            case "Empleado":
                switch (accion) {
                    case "listar":
                        EmpleadoDao empDao = new EmpleadoDao();
                        List<Empleado> lista;
                        lista = empDao.listar();
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("lista", lista);
                        request.getRequestDispatcher("Empleado.jsp").forward(request, response);
                        break;
                    case "Agregar":
                        Empleado emp;
                        String dni = request.getParameter("txtDNI");
                        String nom = request.getParameter("txtNombre");
                        String tel = request.getParameter("txtTelefono");
                        boolean esta = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        String user = request.getParameter("txtUsuario");
                        String email = request.getParameter("txtEmail");
                        int clave = 123;
                        emp = new Empleado(dni, nom, tel, email, user, clave, esta);
                        EmpleadoDao objDao = new EmpleadoDao();
                        int rta = objDao.guardar(emp);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Empleado&accion=listar").forward(request, response);
                        break;
                    case "editar":
                        String id = request.getParameter("id");
                        Empleado ObjEmp;
                        EmpleadoDao eDao = new EmpleadoDao();
                        ObjEmp = eDao.buscar(id);
                        request.setAttribute("fecha", fecha);
                        request.setAttribute("empleado", ObjEmp);
                        request.getRequestDispatcher("Controlar?menu=Empleado&accion=listar").forward(request, response);
                        break;
                    case "Actualizar":
                        Empleado emp1;
                        String dni1 = request.getParameter("txtDNI");
                        String nom1 = request.getParameter("txtNombre");
                        String tel1 = request.getParameter("txtTelefono");
                        Boolean esta1 = Boolean.parseBoolean(request.getParameter("txtEstado"));
                        String usser1 = request.getParameter("txtUsuario");
                        String email1 = request.getParameter("txtEmail");
                        int clave1 = 123;
                        emp1 = new Empleado(dni1, nom1, tel1, email1, usser1, 0, esta1);
                        EmpleadoDao objDao1 = new EmpleadoDao();
                        int rtal = objDao1.actualizar(emp1);
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Empleado&accion=listar").forward(request, response);
                        break;
                    case "Eliminar":
                        String id1;
                        int elimi;
                        id1 = request.getParameter("id");
                        EmpleadoDao emDao = new EmpleadoDao();
                        elimi = emDao.eliminar(id1);
                        // validar elimi
                        request.setAttribute("fecha", fecha);
                        request.getRequestDispatcher("Controlar?menu=Empleado&accion=listar").forward(request, response);

                        break;

                }
        }
    }

    private Detalle validar(int id) {
        for (Detalle producto : lista) {
            if (id == producto.getIdProducto()) {
                return producto;
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            request.setAttribute("msj", "ERROR en el servidor");
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            request.setAttribute("msj", "ERROR en el servidor");
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
