<%@page import="Modelo.entidades.Producto"%>
<%@page import="java.util.List"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            List<Producto> lista;
            lista = (List<Producto>) request.getAttribute("listap");
            Producto objPro = null;
            objPro = (Producto) request.getAttribute("producto");
        %>

      <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlar?menu=Producto" method="post" >
                        <div class="form-group d-flex">
                            <label class="col-sm-3">IdProducto</label>
                            <input type="text" name="txtIdProducto" value="<%=(objPro != null) ? objPro.getIdProducto() : ""%>" class="form-control" placeholder="Ingrese IdProducto">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-3">Nombre</label>
                            <input type="text" name="txtNombre" value="<%=(objPro != null) ? objPro.getNombre(): ""%>" class="form-control" placeholder="Ingrese Nombre">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-3">Precio</label>
                            <input type="text" name="txtPrecio" value="<%=(objPro != null) ? objPro.getPrecio(): ""%>" class="form-control" placeholder="Ingrese Precio">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-3">Descuesto</label>
                            <input type="text" name="txtDescuento" value="<%=(objPro != null) ? objPro.getDescuento(): ""%>" class="form-control" placeholder="Ingrese Descuento">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-3">Stock</label>
                            <input type="text" name="txtStock" value="<%=(objPro != null) ? objPro.getStock() : ""%>" class="form-control" placeholder="Ingrese Stock">
                        </div>
                        <div class="form-group d-flex">
                            <label class="col-sm-3">Estado</label>
                            <input type="text" name="txtEstado"  value="<%=(objPro != null) ? objPro.getEstado(): ""%>" class="form-control" placeholder="Ingrese Estado">
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
                            <th>IDPRODUCTO</th>
                            <th>NOMBRE</th>
                            <th>PRECIO</th>
                            <th>DESCUENTO</th>
                            <th>STOCK</th>
                            <th>ESTADO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody> 
                        <%   if (lista != null) {
                                for (Producto pro : lista) {
                        %>

                        <tr>
                            <td><%= pro.getIdProducto()%> </td>
                            <td><%= pro.getNombre()%></td>
                            <td><%= pro.getPrecio()%></td>
                            <td><%= pro.getDescuento()%></td>
                            <td><%= pro.getStock()%></td>
                            <td><%= pro.getEstado()%></td>
                            <td>
                                <a class="btn btn-warning" href="Controlar?menu=Producto&accion=Guardar&IdProducto=<%=  pro.getIdProducto()%>">Seleccionar</a>
                                <a class="btn btn-danger" href="Controlar?menu=Producto&accion=Eliminar&IdProducto=<%=  pro.getIdProducto()%>">Eliminar</a>
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