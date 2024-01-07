<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cerca Utente per Codice Fiscale</title>
    <!-- Collegamento al CSS di Bootstrap per lo styling della pagina -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
    }

    #particles-js {
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: #6c757d;
        top: 0;
        left: 0;
        z-index: -1;
    }

    .user-form-container {
        position: relative;
        z-index: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        color: white;
    }

    .user-form {
        text-align: center;
        width: 30%;
    }

    h2 {
        margin-bottom: 30px;
    }

    form {
        display: inline-block;
        text-align: left;
        color: white;
    }

    input[type="text"], select {
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        padding: 10px;
        width: calc(100% - 22px);
    }

    .btn-neon, .btn-neon-red {
        margin-top: 20px;
        padding: 10px 20px;
        border-radius: 5px;
        border: none;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
        animation: neon 1.5s infinite alternate;
    }

    .btn-neon {
        background-color: #00ff00;
        box-shadow: 0 0 20px #00ff00, 0 0 40px #00ff00, 0 0 60px #00ff00;
    }

    .btn-neon-red {
        background-color: #ff0000;
        box-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000, 0 0 60px #ff0000;
    }

    @keyframes neon {
        0% {
            opacity: 0.5;
        }
        100% {
            opacity: 1;
        }
    }

    .btn-neon:hover, .btn-neon-red:hover {
        background-color: #333;
        box-shadow: none;
    }
</style>
    <!-- Collegamento alla libreria Particles.js -->

<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
</head>
<body>

    <div id="particles-js"></div>
    <div class="user-form-container">
        <div class="user-form">
            <h2>Cerca Utente per Codice Fiscale</h2>
            <form action="myServlet" method="post">
                        <!-- Form per la ricerca di un utente per codice fiscale -->
            
                <input type="hidden" name="menuChoice" value="3">
                Codice Fiscale da cercare: <input type="text" name="codiceFiscaleRicerca">
                <input type="submit" value="Cerca Utente" class="btn btn-neon">
            </form>
            <form action="myServlet" method="get">
                <input type="hidden" name="menuChoice" value="tornaAlMenu">
                <input type="submit" value="Torna al Menu" class="btn btn-neon-red">
            </form>
        </div>
    </div>
    <!-- Script per inizializzare le particelle -->

    <script>
        particlesJS.load('particles-js', 'particles.json', function() {
            console.log('callback - particles.js config loaded');
        });
    </script>

</body>
</html>
