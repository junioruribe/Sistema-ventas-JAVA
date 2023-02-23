<%-- 
    Document   : Principal
    Created on : 10/11/2022, 08:54:04 AM
    Author     : EDISON
--%>

<%@page import="Modelo.entidades.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body style="background-image: url( imagen/softt.jpg)">
        <%
            Empleado user;
            user = (Empleado)request.getAttribute("usuario");
            request.getSession().setAttribute("usuario", user);
        %>
        <nav class="navbar navbar-expand-lg navbar-light btn-primary">
            <a class="navbar-brand" href="#">
                <img src="imagen/carrito2.jpg" alt="60" width="70"/>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav" style="background-color:black ">
              <ul  class="navbar-nav" >
                    <li class="nav-item active">
                      <a  style="margin-left: 10px; border: none" class="btn btn-outline-light"  href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlar?menu=Producto&accion=ListarProducto" target="myFrame">Producto</a>
                    </li>
                    <li class="nav-item">
                      <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlar?menu=Empleado&accion=listar" target="myFrame">Empleado</a>
                    </li>
                    <li class="nav-item">
                      <a style="margin-left: 10px; border: none" class="btn btn-outline-light " href="Controlar?menu=Cliente&accion=ListarCliente" target="myFrame">Cliente</a>
                    </li>
                    <li class="nav-item">
                      <a style="margin-left: 10px; border: none" class="btn btn-outline-light " href="Controlar?menu=RegistrarVenta&accion=Mostrar" target="myFrame">Nueva Venta</a>
                    </li>
                </ul>
            </div>
            <div class="dropdown" style="margin-right: 115px"  >
                <button style="background-color: black" style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <%= user.getNombre() %>
                </button>
                    <div class="dropdown-menu text-center" style="background-color:deepskyblue">
                  <a class="dropdown-item" href="#">
                      <img src="imagen/usuario.jpg" alt="60" width="60"/>
                  </a>
                  <a class="dropdown-item" href="#"><%= user.getUsuario() %></a>
                  <a class="dropdown-item" href="#"><%= user.getEmail() %></a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="index.jsp">Salir</a>
                </div>
            </div>
        </nav>
        
        <div style="height: 700px;" class="m-4">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none">
                
            </iframe>
        </div>
    </body>
</html>
