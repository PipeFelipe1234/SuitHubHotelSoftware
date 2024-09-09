<%-- 
    Document   : fotosFormulario
    Created on : 9/09/2024, 02:23:56 PM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.FotosTipoHabitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion = request.getParameter("accion");
String id = request.getParameter("id");
String idTipoHabitacion = request.getParameter("idTipoHabitacion");

FotosTipoHabitacion fotoTipoHabitacion = new FotosTipoHabitacion();
fotoTipoHabitacion.setId("");

if ("Modificar".equals(accion) && id != null) {
    fotoTipoHabitacion = new FotosTipoHabitacion(id); 
}
%>

<h3><%= accion.toUpperCase() %> FOTO DEL TIPO DE HABITACIÓN</h3>
<form name="formulario" method="post" action="fotosActualizar.jsp" enctype="multipart/form-data" onsubmit="return validarFormulario();">
    <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
    <img src="presentacion/fotosTipoHabitacion/<%= fotoTipoHabitacion.getFoto() != null ? fotoTipoHabitacion.getFoto() : "placeholder.png" %>" id="foto" width="300" height="200">
    <input type="hidden" name="id" value="<%= fotoTipoHabitacion.getId() %>">
    <input type="hidden" name="idTipoHabitacion" value="<%= idTipoHabitacion %>">
    <input type="submit" name="accion" value="<%= accion %>">
</form>

<script type="text/javascript">
    function mostrarFoto() {
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend = function () {
            document.getElementById("foto").src = lector.result;
        }
    }

    function validarFormulario() {
        var archivo = document.formulario.foto.value;
        if (archivo === "") {
            alert("Por favor, selecciona un archivo de foto.");
            return false;
        }
        return true;
    }
</script>

