<%-- 
    Document   : hotelFormulario
    Created on : 9/09/2024, 11:43:07 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.Hotel"%>
<%
    String accion = request.getParameter("accion");
    String nombre = "";
    String direccion = "";
    String ciudad = "";
    String departamento = "";
    String email = "";
    String telefono = "";
    String reglasDeReserva = "";
    String politicasDepositoYComidas = "";
    String foto = "";

    if (accion.equals("Modificar")) {
        // Solo rellenar los datos si estamos en la acción de modificar
        nombre = request.getParameter("nombre");
        Hotel hotel = new Hotel(nombre);
        direccion = hotel.getDireccion();
        ciudad = hotel.getCiudad();
        departamento = hotel.getDepartamento();
        email = hotel.getEmail();
        telefono = hotel.getTelefono();
        reglasDeReserva = hotel.getReglasDeReserva();
        politicasDepositoYComidas = hotel.getPoliticasDepositoYComidas();
        foto = hotel.getFoto();
    }
%>
<h3><%= accion.toUpperCase() %> HOTEL</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=hotelActualizar.jsp" enctype="multipart/form-data">
    <table border="0">
        <tr>
            <th>Nombre</th>
            <td>
                <input type="text" name="nombre" value="<%= nombre %>" size="50" maxlength="50" required>
            </td>
        </tr>
        <tr><th>Dirección</th><td><input type="text" name="direccion" value="<%= direccion %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Ciudad</th><td><input type="text" name="ciudad" value="<%= ciudad %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Departamento</th><td><input type="text" name="departamento" value="<%= departamento %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Email</th><td><input type="email" name="email" value="<%= email %>" size="50" maxlength="50" required></td></tr>
        <tr><th>Teléfono</th><td><input type="text" name="telefono" value="<%= telefono %>" size="10" maxlength="10" required></td></tr>
        <tr><th>Reglas de Reserva</th><td><textarea name="reglasDeReserva" cols="50" rows="5" required><%= reglasDeReserva %></textarea></td></tr>
        <tr><th>Políticas de Depósito y Comidas</th><td><textarea name="politicasDepositoYComidas" cols="50" rows="5" required><%= politicasDepositoYComidas %></textarea></td></tr>
        <tr><th>Foto</th><td><input type="file" name="foto" accept="image/*" onchange="mostrarFoto();"></td></tr>
    </table>
    
    <!-- Campo oculto para el nombre original (en caso de modificar) -->
    <input type="hidden" name="nombreOriginal" value="<%= nombre %>">
    
    <!-- Botón para enviar el formulario -->
    <input type="submit" name="accion" value="<%= accion %>">
</form>

<!-- Mostrar imagen previa -->
<img src="presentacion/imagenes/<%= foto %>" id="foto" width="350" height="350" alt="Vista previa de la imagen del hotel">

<script type="text/javascript"> 
    function mostrarFoto(){
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend = function(){
            document.getElementById("foto").src = lector.result;
        }
    }
</script>

