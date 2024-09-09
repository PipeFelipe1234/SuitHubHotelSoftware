<%-- 
    Document   : InicioSesion
    Created on : 9/09/2024, 02:28:22 PM
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
            height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            background-image: url('<%= fotoUrl %>');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: bottom;
            background-attachment: fixed;
        }

        .logo {
            position: absolute;
            top: 5%;
            left: 5%;
        }

        .logo img {
            width: 122px;
            height: 100px;
            border-radius: 50%;
            box-shadow: 20px 25px 70px 10px;
        }

        main a {
            background-color: #060504;
            padding: 7px 20px;
            color: #d6a77d;
            transition: .4s;
        }

        main a:hover {
            background-color: #212020;
        }

        #tarjetas {
            padding: 25px 30px;
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .t__descripcion,
        .t__enlace {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .tarjeta {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 4px 4px 6px rgba(214, 167, 125, .6);
        }

        .tarjeta p {
            color: white;
        }

        .tarjeta a {
            background-color: yellow;
            padding: 7px 20px;
            color: black;
            transition: .4s;
            margin-top: 20px;
        }

        .tarjeta a:hover {
            background-color: #212020;
        }

        .tarjeta img {
            width: 90%;
            height: auto;
        }

        .descripcion {
            border: none;
            text-align: center;
        }

        .descripcion p {
            padding: 20px;
            text-align: justify;
        }

        .enlace {
            padding: 20px;
        }

        footer {
    background-color: #000;
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 20px;
    color: #d6a77d; /* Color de texto por defecto */
}

    footer p {
        color: #d6a77d; /* Asegura que el texto en el footer tenga el color adecuado */
    }

    footer img.logo {
        width: 70px;
        height: 70px;
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
    <title>SuitHub</title>
</head>
<body>
    <header>
        <nav>
            <a href="InicioSesion.jsp">Inicio</a>
            <a href="index.jsp">Log In</a>
            <a href="SobreNosotros.jsp">Sobre Nosotros</a>
            <a href="reservas.html">Reservas</a>
            <a href="Quejasyreclamos.html">PQR's</a>
            <a href="#"><i class="bi bi-list"></i></a>
        </nav>
    </header>
    <main>
        <div class="logo">
            <img src="/SuitHubWeb/presentacion/imagenes/logo.jpg" alt="Logo empresa">
        </div>
        <a href="#">Reserva Ahora</a>
    </main>
    <section id="tarjetas">
        <div class="t__descripcion">
            <div class="tarjeta descripcion">
                <img src="/SuitHubWeb/presentacion/imagenes/campana.jpg" alt="img de hotel">
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odio at velit omnis dolore similique doloribus voluptas aliquam in, hic numquam incidunt ducimus! Quae atque perferendis voluptate numquam, et iste saepe?</p>
            </div>
            <div class="tarjeta descripcion">
                <img src="/SuitHubWeb/presentacion/imagenes/comidaa.jpg" alt="img de hotel">
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odio at velit omnis dolore similique doloribus voluptas aliquam in, hic numquam incidunt ducimus! Quae atque perferendis voluptate numquam, et iste saepe?</p>
            </div>
            <div class="tarjeta descripcion">
                <img src="/SuitHubWeb/presentacion/imagenes/pisina.jpeg" alt="img de hotel">
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odio at velit omnis dolore similique doloribus voluptas aliquam in, hic numquam incidunt ducimus! Quae atque perferendis voluptate numquam, et iste saepe?</p>
            </div>
        </div>

        <div class="t__enlace">
            <div class="tarjeta  enlace">
                <img src="/SuitHubWeb/presentacion/imagenes/man.jpg" alt="img de hotel">
                
            </div>
            <div class="tarjeta  enlace">
                <img src="/SuitHubWeb/presentacion/imagenes/luj.jpg" alt="img de hotel">
                <a href="politicasYReservas.jsp">Politicas y Reglas de Reserva</a>
            </div>
            <div class="tarjeta enlace">
                <img src="/SuitHubWeb/presentacion/imagenes/ha.jpg" alt="img de hotel">
                
            </div>
            
        </div>
    </section>
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
