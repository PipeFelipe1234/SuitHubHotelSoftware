<%-- 
    Document   : politicasYReservas
    Created on : 9/09/2024, 11:56:43 AM
    Author     : ANDRES FELIPE
--%>
<%@page import="clases.Hotel"%>
<%
    // Crear una instancia de Hotel y cargar los datos desde la base de datos
    Hotel hotel = new Hotel(); // Crear instancia sin parámetros
    hotel.cargar(); // Cargar el único registro de hotel desde la base de datos

    // Obtener los detalles dinámicamente desde el hotel cargado
    String nombreHotel = hotel.getNombre();
    String ciudad = hotel.getCiudad();
    String departamento = hotel.getDepartamento();
    String direccion = hotel.getDireccion();
    String email = hotel.getEmail();
    String telefono = hotel.getTelefono();
    String reglasDeReserva = hotel.getReglasDeReserva();
    String politicasYDeposito = hotel.getPoliticasDepositoYComidas();
    String fotoUrl = "/SuitHubWeb/presentacion/imagenes/" + hotel.getFoto();

    // Concatenar ciudad y departamento
    String ciudadDepartamento = ciudad + "-" + departamento;
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <!-- css -->
    <link rel="stylesheet" href="presentacion/stylesheet.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            text-decoration: none;
        }

        header {
            padding: 10px 0;
            background-color: #060504;
        }

        body {
            background-color: #060504;
            color: #d6a77d;
        }

        nav {
            display: flex;
            justify-content: end;
            align-items: center;
            width: 90%;
            margin: 0 auto;
        }

        nav a {
            margin-left: 25px;
            font-size: 1.3rem;
            color: #d6a77d;
            transition: .4s;
        }

        nav a:hover {
            color: #fff;
        }

        nav a i {
            margin-left: 40px;
            font-size: 2rem;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content {
            width: 95%;
            max-width: 1400px;
            margin: 0 auto;
            background-color: #212020;
            padding: 20px;
            border-radius: 10px;
            color: #d6a77d;
        }

        .content h2 {
            margin-bottom: 10px;
        }

        .content .section {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .reglas, .politicas {
            flex: 1;
        }

        .reglas textarea,
        .politicas textarea {
            width: 100%; /* Ancho del campo de texto */
            height: 500px; /* Altura del campo de texto */
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #d6a77d;
            background-color: #333;
            color: #fff; /* Color del texto dentro del textarea */
            resize: none;
            box-sizing: border-box;
        }

        footer {
            background-color: #000;
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 20px;
            color: #d6a77d;
        }

        footer img {
            width: 70px;
            height: 50px;
            border-radius: 50%;
        }
        
        footer img.photo {
            width: 100px; /* Ancho deseado para la foto */
            height: 60px; /* Alto deseado para la foto */
            object-fit: cover; /* Ajusta la imagen para cubrir el contenedor sin distorsionarse */
            border-radius: 0; /* Sin bordes redondeados */
            margin: 0 20px; /* Espacio alrededor de la imagen */
        }


        .redes {
            display: flex;
            gap: 20px;
        }

        .redes i {
            font-size: 1.5rem;
            color: #d6a77d;
        }

        .contacto p {
            color: #d6a77d;
        }
    </style>
    <title>Políticas y Reglas</title>
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
    <main>
        <div class="content">
            <div class="section">
                <div class="reglas">
                    <h2>Reglas de Reserva</h2>
                    <textarea readonly><%= reglasDeReserva %></textarea>
                </div>
                <div class="politicas">
                    <h2>Políticas y Depósitos</h2>
                    <textarea readonly><%= politicasYDeposito %></textarea>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <img src="/SuitHubWeb/presentacion/imagenes/logo.jpg" alt="Logo de la empresa">
        <p><%= ciudadDepartamento %></p>
        <img src="<%= fotoUrl %>" alt="Foto pequeña" class="photo">
                <p><%= direccion %></p>
        <div class="redes">
            <a href="#"><i class="bi bi-facebook"></i></a>
            <a href="#"><i class="bi bi-instagram"></i></a>
            <a href="#"><i class="bi bi-linkedin"></i></a>
        </div>
        <div class="contacto">
            <p><strong>Email: </strong><%= email %></p>
            <p><strong>Teléfono: </strong><%= telefono %></p>
        </div>
    </footer>
</body>
</html>

