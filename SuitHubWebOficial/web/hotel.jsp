<%-- 
    Document   : hotel
    Created on : 9/09/2024, 11:39:47 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="java.util.List"%>
<%@page import="clases.Hotel"%>
<%
    List<Hotel> datos = Hotel.getListaEnObjetos(null, null);

    if (datos.isEmpty()) {
%>
        <h3>Aún no tienes registrado tu Hotel</h3>
        <a href="principal.jsp?CONTENIDO=hotelFormulario.jsp&accion=Adicionar">
            <button>Adicionar Hotel</button>
        </a>
<%
    } else {
        Hotel hotel = datos.get(0); // El único hotel registrado
%>
        <h3>DETALLES DEL HOTEL</h3>
        <table border="1">
            <tr>
                <th>Nombre</th><th>Dirección</th><th>Ciudad</th><th>Departamento</th><th>Email</th><th>Teléfono</th><th>Reglas de Reserva</th><th>Políticas Deposito/Comidas</th><th>Foto</th><th>Acción</th>
            </tr>
            <tr>
                <td><%= hotel.getNombre() %></td>
                <td><%= hotel.getDireccion() %></td>
                <td><%= hotel.getCiudad() %></td>
                <td><%= hotel.getDepartamento() %></td>
                <td><%= hotel.getEmail() %></td>
                <td><%= hotel.getTelefono() %></td>
                <td><%= hotel.getReglasDeReserva() %></td>
                <td><%= hotel.getPoliticasDepositoYComidas() %></td>
                <td><img src="presentacion/imagenes/<%= hotel.getFoto() %>" width="120" height="120"></td>
                <td>
                    <a href="principal.jsp?CONTENIDO=hotelFormulario.jsp&accion=Modificar&nombre=<%= hotel.getNombre() %>" title="Modificar">
                        <img src="presentacion/imagenes/modificar.png" width="30" height="30" alt="Modificar">
                    </a>
                </td>
            </tr>
        </table>
<%
    }
%>
