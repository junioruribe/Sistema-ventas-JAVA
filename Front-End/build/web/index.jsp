<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="text/css" href="./css/cssstyle.css"
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body style="background-image:url(imagen/soft.jpg)"> 
        <div class="container mt-4 col-lg-4" >
            <div class="card col-sm-10" style="background-image:url(imagen/princ.jpg)" >
                <div class="card-body " style="background-color:url(imagen/enlaza.jpg)" >
                    <form action="Validacion" method="get" class="needs-validation">
                        <div class="form-group text-center">
                            <h3>Login</h3>
                            <img src="imagen/usuario.jpg" alt="70" width="170" /> <br>
                            <label>Bienvenido al sistema</label>
                        </div>
                         <div class="form-group"> 
                             <label >Usuario:</label>
                             <input type="text" name="txtUsuario" class="form-control" placeholder="Ingrese Usuario">
                        </div>
                         <div class="form-group"> 
                             <label>Password:</label>
                             <input type="password" name="txtClave" class="form-control" placeholder="Ingrese Password">
                        </div>
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
