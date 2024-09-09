<%-- 
    Document   : index
    Created on : 9/09/2024, 11:51:35 AM
    Author     : ANDRES FELIPE
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    if (request.getParameter("error") != null) {
        switch (request.getParameter("error")) {
            case "1":
                mensaje = "Usuario o contraseña no válidos";
                break;
            case "2":
                mensaje = "Acceso denegado";
                break;
            default:
                mensaje = "Error desconocido";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SuitHub - Iniciar Sesión</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="presentacion/InicioSesion.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Roboto:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <nav>
                <a href="InicioSesion.jsp">Inicio</a>
                <a href="index.jsp">Log In</a>
                <a href="SobreNosotros.html">Sobre Nosotros</a>
                <a href="reservas.html">Reservas</a>
                <a href="Quejasyreclamos.html">PQR's</a>
                <a href="#"><i class="bi bi-list"></i></a>
            </nav>
        </header>
        <aside>
            <form name="formulario" method="post" action="validar.jsp">
                <h1>Iniciar Sesión</h1>
                <h5>Dirección Email</h5>
                <input type="text" name="identificacion" id="box" required>
                <h5>Contraseña</h5>
                <input type="password" name="clave" id="box" required>
                <h6>Debe ser una combinación de mínimo 8 caracteres, números y símbolos</h6>
                <input type="checkbox" name="recordarme" id="checkboxs">
                <p>Recordarme</p>
                <a href="#">¿Olvidaste contraseña?</a>
                <br>
                <button type="submit" id="inicio">Iniciar Sesión</button>
                <br>
                <button id="inicioGoogle"><i class="fa-brands fa-google"></i> Inicia Sesión con Google</button>
                <button id="inicioFacebook"><i class="fa-brands fa-facebook-f"></i> Inicia Sesión con Facebook</button>
                <p id="error"><%=mensaje%></p>
            </form>
        </aside>
        <aside id="2">
            <p>¿No tienes cuenta? <a href="registrarse.jsp">Inscríbete</a>.</p>
        </aside>

        <section>
            <img id="imagen" src="/SuitHubWeb/presentacion/imagenes/suitehub.jpeg" alt="Imagen de SuiteHub">
        </section>
    </body>
</html>

