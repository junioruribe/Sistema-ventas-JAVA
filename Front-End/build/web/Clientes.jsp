<%@page import="java.util.List"%>
<%@page import="Modelo.entidades.Cliente"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body background="bosque.jpg">
        <%
            List<Cliente> lista;
            lista = (List<Cliente>) request.getAttribute("listac");
            Cliente objcli = null;
            objcli = (Cliente) request.getAttribute("cliente");

        %>


        <div class="d-flex" background="imagen" >
            <div class="card col-sm-3">
                <div class="card-body">
                    <form action="Controlar?menu=Cliente" method="post" >
                        <div class="form-group">
                            <label>DNI</label>
                            <input type="text" name="txtDNI" value="<%=(objcli != null) ? objcli.getIdCliente(): ""%>" class="form-control" placeholder="Ingrese DNI">
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="txtNombre" value="<%=(objcli != null) ? objcli.getNombre(): ""%>" class="form-control" placeholder="Ingrese Nombre">
                        </div>
                        <div class="form-group">
                            <label>Direccion</label>
                            <input type="text" name="txtDireccion" value="<%=(objcli != null) ? objcli.getDireccion(): ""%>"  class="form-control" placeholder="Ingrese Direccion">
                        </div>
                        <div class="form-group">
                            <label>Estado</label>
                            <input type="text" name="txtEstado" value="<%=(objcli != null) ? objcli.getEstado(): ""%>"  class="form-control" placeholder="Ingrese Estado">
                        </div>
                        <div class="text-center">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-danger" >
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-dark" >
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
                            <th>DIRECCION</th>
                            <th>ESTADO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>  
                        <%   if (lista != null) {
                                for (Cliente cli : lista) {
                        %>

                        <tr>
                            <td><%= cli.getIdCliente()%> </td>
                            <td><%= cli.getNombre()%> </td>
                            <td><%= cli.getDireccion()%> </td>
                            <td> <%= cli.getEstado()%> </td>

                            <td>
                                <a class="btn btn-warning" href="Controlar?menu=Cliente&accion=guardar&IdCliente=<%=  cli.getIdCliente() %>">Seleccionar</a>
                                <a class="btn btn-danger" href="Controlar?menu=Cliente&accion=Eliminar&IdCliente=<%=  cli.getIdCliente() %>">Eliminar</a>


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