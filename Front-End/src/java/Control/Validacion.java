package Control;

import Modelo.EmpleadoDao;
import Modelo.entidades.Empleado;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Validacion", urlPatterns = {"/Validacion"})
public class Validacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String accion;
        accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String user;
            int clave;
            user = request.getParameter("txtUsuario");
            clave = Integer.parseInt(request.getParameter("txtClave"));
            EmpleadoDao empDao = new EmpleadoDao();
            Empleado obj = empDao.login(user, clave);
            if (obj == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("usuario", obj);
                request.getRequestDispatcher("Controlar?menu=Principal").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            request.setAttribute("msj", "ERROR en el servidor");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            request.setAttribute("msj", "ERROR en el servidor");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
