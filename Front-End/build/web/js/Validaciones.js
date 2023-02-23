let accion;
function peticion (pet){
    accion=pet;
}

function validar(){
    let cod;
    if (accion==="BuscarCliente") {
        cod=document.getElementById("txtCodigoCli").value;
        if (cod==="") {
            alert('Dato incorrecto');
            return false;
        } else {
            return true;
        }
    } else if (accion==="BuscarProducto") {
          cod=document.getElementById("txtCodigoPro").value;
          if (cod===""|| isNaN(cod)) {
              alert('Dato incorrecto');
            return false;
        } else {
            return true;
        }
         } else if (accion==="Agregar") {
          cod=document.getElementById("txtCantidad").value;
          if (cod===""|| isNaN(cod)|| cod<=0) {
              alert('Cantidad incorrecta');
            return false;
        } else {
            return true;
        }
    }else if(accion==="Limpiar"){
        document.getElementById("txtCodigoCli").value="";
        document.getElementById("txtNombreCli").value="";
        document.getElementById("txtCodigoPro").value="";
        document.getElementById("txtNombrePro").value="";
        document.getElementById("txtCantidad").value="";
        document.getElementById("txtPrecio").value="";
        document.getElementById("txtStock").value="";
        document.getElementById("txtDescuento").value="";
        return false;
    }
}




