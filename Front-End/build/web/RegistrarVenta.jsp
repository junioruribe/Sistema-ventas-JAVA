<%-- 
    Document   : RegistrarVenta
    Created on : 10/11/2022, 10:32:20 PM
    Author     : EDISON
--%>

<%@page import="Modelo.entidades.Venta"%>
<%@page import="java.lang.Double"%>
<%@page import="Modelo.entidades.Cliente"%>
<%@page import="Modelo.entidades.Detalle"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.entidades.Producto"%>
<%@page import="Modelo.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="../js/Validaciones.js"> </script>
    </head>
    <body>
        <%
           // String nomC, idCli;
           // nomC = request.getParameter("nom");
           // idCli = request.getParameter("dni");
           Cliente objCli;
           objCli=(Cliente)request.getAttribute("cliente");
            Producto objPro;
            objPro = (Producto) request.getAttribute("Producto");
            String nroF;
            nroF=request.getAttribute("nroFactura").toString();
            String fecha;
            fecha=request.getAttribute("fecha").toString();
            
        %>
        <div class="d-flex">
            <div class="col-sm-4">
                <div class="card">
                    <form action="Controlar?menu=RegistrarVenta" method="post" onsubmit="return validar()">
                        <div class="card-body" >
                            <div class="form-group text-center" style="background-color:  lavender" >
                                <label>Datos del cliente</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="txtCodigoCli" id="txtCodigoCli" value="<%=(objCli != null) ? objCli.getIdCliente() : ""%>" class="form-control " placeholder="Codigo">
                                    <input type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info" onclick="peticion(this.value)">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="txtNombreCli" id="txtNombreCli" value="<%=(objCli != null) ? objCli.getNombre() : ""%>" class="form-control " readonly="true" >
                                </div>
                            </div>
                            <div class="form-group text-center" style="background-color:mistyrose " >
                                <label>Datos del Producto</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="txtCodigoPro" id="txtCodigoPro" value="<%=(objPro != null) ? objPro.getIdProducto() : ""%>" class="form-control " placeholder="Codigo">
                                    <input type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info" onclick="peticion(this.value)" >
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="txtNombrePro" id="txtNombrePro" value="<%=(objPro != null) ? objPro.getNombre() : ""%>" class="form-control" readonly="true" >
                                </div> 
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-3">
                                    <input type="text" name="txtPrecio" id="txtPrecio" value="<%=(objPro != null) ? objPro.getPrecio() : ""%>" class="form-control" placeholder="$ 0,000.00" readonly="true">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" name="txtDescuento" id="txtDescuento" value="<%=(objPro != null) ? objPro.getDescuento() : ""%>" class="form-control" placeholder="% Descuento" readonly="true">
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" name="txtCantidad" id="txtCantidad" class="form-control" placeholder="" >
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" name="txtStock" id="txtStock" value="<%=(objPro != null) ? objPro.getStock(): ""%>" class="form-control" placeholder="Stock" readonly="true" >
                                </div>
                            </div>
                            <div class="form-control text-center" style="border: none">
                                <input type="submit" name="accion" value="Agregar" class="btn-outline-info" onclick="peticion(this.value)">&nbsp;&nbsp;
                                <input type="submit" name="accion" value="Limpiar" class="btn-success" onclick="peticion(this.value)">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="card">
                    <div class="col-sm-5 ml-auto">
                        <form action="Controlar?menu=RegistrarVenta" method="post">
                           <div class="d-flex col-sm-6-auto">
                            <label>NroFactura:&nbsp;</label>
                            <input type="text" name="txtNroFactura" value="<%=(nroF != null) ? nroF : ""%>" class="form-control font-weight-bold">
                            &nbsp;&nbsp;
                            <label>Fecha:&nbsp;</label>
                            <input type="text" name="txtFecha" value="<%=(fecha != null) ? fecha : ""%>" class="form-control font-weight-bold">
                            &nbsp;
                            <input type="submit" name="accion" value="Buscar" class="btn-success ">
                           </div>
                        </form>
                    </div>
                    <br>
                    <table class="table table-hover"  >
                        <thead>
                        <th>IdProducto</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>porDescuento</th>
                        <th>vrDescuento</th>
                        <th>Subtotal</th>
                        <th>Total</th>
                        <th>Acciones</th>
                        </thead>
                        <tbody>
                            <%
                                List<Detalle> lista;
                                double vrtotal;
                                vrtotal=(Double)request.getAttribute("vrtotal");
                                lista = (List<Detalle>) request.getAttribute("listaVen");
                                if (lista != null) {
                                    for (Detalle venta : lista) {
                              
                            %>
                            <tr>
                                <td><%=venta.getIdProducto()%></td>
                                <td><%=venta.getNombre()%></td>
                                <td><%=venta.getPrecio()%></td>
                                <td><%=venta.getCantidad()%></td>
                                <td><%=venta.getPorDescuento()%></td>
                                <td><%=venta.getVrDescuento()%></td>
                                <td><%=venta.getSubTotal()%></td>
                                <td><%=venta.getTotal()%></td>
                                <td>
                                    <a class="btn btn-danger" href="Controlar?menu=RegistrarVenta&accion=Eliminar&id=<%=venta.getIdProducto()%>">Eliminar </a>
                                </td>
                               
                            </tr>
                            <%}
                                }%>
                        </tbody>
                    </table> 
                </div>
            <div class="card-footer d-flex" >
                <div class="d-flex col-sm-6">
                    <form action="Controlar?menu=RegistrarVenta" method="post">
                     <input type="submit" name="accion" value="AgregarVenta" class="btn btn-success">&nbsp;
                    <input type="submit" name="accion" value="Cancelar" class="btn btn-danger"> 
                    </form>
                </div>
                <div class="d-flex col-sm-6 lm-outo ">
                    <label>TOTAL:</label>&nbsp;
                    <input type="text" value="$&nbsp;<%=vrtotal%>" class="font-weight-bold">
                </div>
            </div>
            </div>
        </div>
    </body>
</html>
