<%-- 
    Document   : inventarioTipoHabitacionFormulario
    Created on : 9/09/2024, 11:33:55 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="clases.InventarioTipoHabitacion"%>
<%@page import="clases.Inventario, clases.TipoHabitacion" %>
<%
    String accion = request.getParameter("accion");
    String id = "Sin generar";
    String idInventario = "";
    String cantidad = "";
    String idTipoHabitacion = request.getParameter("idTipoHabitacion");
    Inventario inventario = null;

    if (accion.equals("Modificar")) {
        String idInventarioTipoHabitacion = request.getParameter("id");
        InventarioTipoHabitacion inventarioTipoHabitacion = new InventarioTipoHabitacion(idInventarioTipoHabitacion);
        id = inventarioTipoHabitacion.getId();
        idInventario = inventarioTipoHabitacion.getIdInventario();
        cantidad = inventarioTipoHabitacion.getCantidad();

        // Cargar detalles del inventario
        inventario = new Inventario(idInventario);
    }
%>

<h3><%= accion.toUpperCase() %> INVENTARIO HABITACIÓN <%= new TipoHabitacion(idTipoHabitacion).getNombre() %></h3>

<form name="formulario" method="post" action="principal.jsp?CONTENIDO=inventarioTipoHabitacionActualizar.jsp">
    <table border="0">
        <tr><th>Id</th><td><%= id %></td></tr>
        <tr>
            <th>Items</th>
            <td>
                <input type="text" id="autocompleteItems" placeholder="Escriba el nombre del ítem" value="<%= inventario != null ? inventario.getNombre() : "" %>">
                <input type="hidden" id="idInventario" name="idInventario" value="<%= idInventario %>">
            </td>
        </tr>
        <tr>
            <th>Valor Unitario</th>
            <td><input type="text" id="valorUnitario" readonly value="<%= inventario != null ? inventario.getValorUnitario() : "" %>"></td>
        </tr>
        <tr>
            <th>Descripción</th>
            <td><textarea id="descripcion" readonly><%= inventario != null ? inventario.getDescripcion() : "" %></textarea></td>
        </tr>
        <tr>
            <th>Cantidad</th>
            <td><input type="number" name="cantidad" value="<%= cantidad %>" required></td>
        </tr>
    </table>
    <input type="hidden" name="idTipoHabitacion" value="<%= idTipoHabitacion %>">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="submit" name="accion" value="<%= accion %>">
</form>

<script type="text/javascript">
    $(document).ready(function() {
        let inventarios = <%= Inventario.getListaCompletaEnArregloJS("", "") %>; // Obtener la lista completa

        // Configurar el autocompletado
        $("#autocompleteItems").autocomplete({
            source: function(request, response) {
                let input = request.term.toLowerCase();
                let listaFiltrada = inventarios.filter(inventario => inventario[1].toLowerCase().includes(input));
                
                response(listaFiltrada.map(inventario => ({
                    value: inventario[1],  // Nombre del producto
                    id: inventario[0],  // id
                    valorUnitario: inventario[3],  // Valor unitario
                    descripcion: inventario[2]  // Descripción
                })));
            },
            select: function(event, ui) {
                $("#idInventario").val(ui.item.id);
                $("#valorUnitario").val(ui.item.valorUnitario);
                $("#descripcion").val(ui.item.descripcion);
            }
        });
    });
</script>