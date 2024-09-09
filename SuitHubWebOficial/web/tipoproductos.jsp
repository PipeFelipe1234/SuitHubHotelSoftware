<%-- 
    Document   : tipoproductos
    Created on : 9/09/2024, 11:20:47 AM
    Author     : ANDRES FELIPE
--%>

<%@page import="java.util.List"%>
<%@page import="clases.TipoProducto"%>
<%
    String lista = " ";
    List<TipoProducto> datos = TipoProducto.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        TipoProducto tipoProducto = datos.get(i);
        lista += "<tr>";
        lista += "<td align='right'>" + tipoProducto.getId() + "</td>";
        lista += "<td>" + tipoProducto.getNombre() + "</td>";
        lista += "<td>" + tipoProducto.getDescripcion() + "</td>";
        lista += "<td>";
        lista += "<a href='principal.jsp?CONTENIDO=tipoProductosFormulario.jsp&accion=Modificar&id=" + tipoProducto.getId() +
            "' title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' height='30'></a> "; 
        lista += "<img src='presentacion/imagenes/eliminar.png' width='30' height='30' title='Eliminar' onClick='eliminar(" + tipoProducto.getId() + ")'> ";
        lista += "</td>";
        lista += "</tr>";
    }
%>
<h3>LISTA DE TIPOS DE PRODUCTO</h3>
<table border="1">
    <tr>
        <th>Id</th><th>Nombre</th><th>Descripción</th>
        <th><a href="principal.jsp?CONTENIDO=tipoProductosFormulario.jsp&accion=Adicionar">
                <img src="presentacion/imagenes/add.png" width='30' height='30'></a></th>
    </tr>
    <%= lista %>
</table>

<script type="text/javascript">
    function eliminar(id){
        respuesta = confirm("Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=tipoProductosActualizar.jsp&accion=Eliminar&id=" + id;
        }
    }
</script>
