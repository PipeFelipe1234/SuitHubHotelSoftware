<%-- 
    Document   : registrarse
    Created on : 9/09/2024, 12:04:29 PM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.Persona" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    if (request.getParameter("registrar") != null) {
        // Recibir datos del formulario
        String identificacion = request.getParameter("identificacion");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String genero = request.getParameter("genero");
        String nacionalidad = request.getParameter("nacionalidad");
        String telefono = request.getParameter("telefono");
        String departamento = request.getParameter("codigoDepartamento");
        String codigoCiudad = request.getParameter("codigoCiudad");
        String email = request.getParameter("email");
        String tipo = "usuario"; // Puedes definir un tipo por defecto
        String clave = request.getParameter("clave");

        // Crear objeto Persona
        Persona nuevaPersona = new Persona();
        nuevaPersona.setIdentificacion(identificacion);
        nuevaPersona.setNombre(nombre);
        nuevaPersona.setApellido(apellido);
        nuevaPersona.setGenero(genero);
        nuevaPersona.setNacionalidad(nacionalidad);
        nuevaPersona.setTelefono(telefono);
        nuevaPersona.setCodigoCiudad(codigoCiudad);
        nuevaPersona.setEmail(email);
        nuevaPersona.setTipo(tipo);
        nuevaPersona.setClave(clave);

        // Intentar grabar en la base de datos
        if (nuevaPersona.grabar()) {
            mensaje = "Registro exitoso. ¡Bienvenido!";
        } else {
            mensaje = "Error al registrar. Por favor, inténtelo de nuevo.";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Usuario</title>
        <link rel="stylesheet" href="presentacion/estiloRegistro.css">
    </head>
    <body>
        <header>
            <nav>
                <a href="index.jsp">Inicio</a>
                <a href="InicioSesion.jsp">Log In</a>
                <a href="SobreNosotros.jsp">Sobre Nosotros</a>
                <a href="reservas.jsp">Reservas</a>
                <a href="Quejasyreclamos.jsp">PQR's</a>
            </nav>
        </header>
        <div class="form-container">
            <h1>Registrarse</h1>
            <form method="post" action="registrarse.jsp">
                <label for="identificacion">Identificación:</label>
                <input type="text" name="identificacion" required>
                
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" required>
                
                <label for="apellido">Apellido:</label>
                <input type="text" name="apellido" required>
                
                <label for="genero">Género:</label>
                <select name="genero" required>
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="O">Otro</option>
                </select>
                
                <label for="nacionalidad">Nacionalidad:</label>
                <input type="text" name="nacionalidad" required>
                
                <label for="telefono">Teléfono:</label>
                <input type="text" name="telefono" required>
                
                <label for="codigoCiudad">Código Ciudad:</label>
                <input type="text" name="codigoCiudad" required>
                
                <label for="email">Email:</label>
                <input type="email" name="email" required>
                
                <label for="clave">Contraseña:</label>
                <input type="password" name="clave" required>
                
                <button type="submit" name="registrar">Registrarse</button>
            </form>
            <p><%=mensaje%></p>
        </div>
    </body>
</html>
