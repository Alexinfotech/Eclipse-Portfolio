<%@ page import="it.molinari.controller.model.Persona"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Risultato della Ricerca per Codice Fiscale</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
    }

    #particles-js {
        position: fixed;
        width: 100%;
        height: 100%;
        background-color: #6c757d;
        top: 0;
        left: 0;
        z-index: -1;
    }

    .result-container {
        position: relative;
        z-index: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        text-align: center;
    }

    .result-box {
        background: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 20px;
    }

    h2 {
        color: #333;
    }

    p {
        margin: 10px 0;
        color: #333;
    }

    a {
        text-decoration: none;
        color: #007bff;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #0056b3;
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
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
</head>
<body>

    <div id="particles-js"></div>

    <div class="result-container">
        <div class="result-box">
            <h2>Risultato della Ricerca per Codice Fiscale</h2>
            <%
            Persona personaRicercata = (Persona) request.getAttribute("personaRicercata");
            if (personaRicercata != null) {
            %>
            <p>Tipo Utente: <%= personaRicercata.getTipoUtente() %></p>
            <p>Nome: <%= personaRicercata.getNome() %></p>
            <p>Cognome: <%= personaRicercata.getCognome() %></p>
            <p>Codice Fiscale: <%= personaRicercata.getCodiceFiscale() %></p>
            <%
            } else {
            %>
            <p>Nessun utente trovato con il codice fiscale fornito.</p>
            <%
            }
            %>
            <form action="myServlet" method="get">
                <input type="hidden" name="menuChoice" value="tornaAlMenu">
                <input type="submit" value="Torna al Menu" class="btn btn-neon-red">
            </form>
        </div>
    </div>

    <script>
        particlesJS.load('particles-js', 'particles.json', function() {
            console.log('callback - particles.js config loaded');
        });
    </script>

</body>
</html>

