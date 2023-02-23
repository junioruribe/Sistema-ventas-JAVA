<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.entidades.Empleado"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleado</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            ArrayList<Empleado> lista;
            lista = (ArrayList<Empleado>) request.getAttribute("lista");
            Empleado objEmp = null;
            objEmp = (Empleado) request.getAttribute("empleado");
        %>

        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlar?menu=Empleado" method="post" >
                        <div class="form-group d-flex">
                            <label class="col-sm-2">DNI</label>
                            <input type="text" name="txtDNI" value="<%=(objEmp != null) ? objEmp.getDni() : ""%>" class="form-control" placeholder="Ingrese DNI">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-2">Nombre</label>
                            <input type="text" name="txtNombre" value="<%=(objEmp != null) ? objEmp.getNombre() : ""%>" class="form-control" placeholder="Ingrese Nombre">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-2">Email</label>
                            <input type="text" name="txtEmail" value="<%=(objEmp != null) ? objEmp.getEmail() : ""%>" class="form-control" placeholder="Ingrese Email">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-2">Telefono</label>
                            <input type="text" name="txtTelefono" value="<%=(objEmp != null) ? objEmp.getTelefono() : ""%>" class="form-control" placeholder="Ingrese Telefono">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-2">Estado</label>
                            <input type="text" name="txtEstado"  value="<%=(objEmp != null) ? objEmp.isEstado() : ""%>" class="form-control" placeholder="Ingrese Estado">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-2">Usuario</label>
                            <input type="text" name="txtUsuario" value="<%=(objEmp != null) ? objEmp.getUsuario() : ""%>" class="form-control" placeholder="Ingrese Usuario">
                        </div>
                        <div class="text-center"> 
                            <input type="submit" name="accion" value="Agregar" class="btn btn-dark" >
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-warning" >
                        </div>

                    </form>
                </div>
            </div>

            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>DNI</th>
                            <th>NOMBRE</th>
                            <th>EMAIL</th>
                            <th>TELEFONO</th>
                            <th>ESTADO</th>
                            <th>USUARIO</th>
                            <th>ACCIONES</th>
                        </tr> 
                    </thead>
                    <tbody>
                        <%if (lista != null) {
                                for (Empleado emp : lista) {%>
                        <tr>
                            <td> <%=  emp.getDni()%></td>
                            <td> <%=  emp.getNombre()%></td>
                            <td> <%=  emp.getEmail() %></td>
                            <td> <%=  emp.getTelefono()%></td>
                            <td> <%=  emp.isEstado()%></td>
                            <td> <%=  emp.getUsuario()%></td>

                            <td>
                                <a class="btn btn-warning" href="Controlar?menu=Empleado&accion=editar&id=<%=  emp.getDni()%>">Seleccionar</a>
                                <a class="btn btn-danger" href="Controlar?menu=Empleado&accion=Eliminar&id=<%=  emp.getDni()%>">Eliminar</a>
                            </td>
                        </tr>
                        <%

                                }
                            }

                        %>
                    </tbody>
                </table>
            </div> 
        </div>
    </body>
</html>
