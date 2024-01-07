<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    rel="stylesheet">
<style>
/* Stili aggiuntivi  nella pagina index */
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

.menu-container {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    color: white;
}

.menu {
    text-align: center;
    width: 100%;
}

h1 {
    margin-bottom: 30px;
}

form {
    display: inline-block;
    text-align: left;
}

input[type="radio"] {
    margin-right: 10px;
}

input[type="submit"] {
    margin-top: 20px;
}

.btn-neon {
    background-color: #00ff00;
    /* Colore di sfondo verde neon */
    color: #fff;
    /* Testo bianco */
    border: none;
    /* Rimuovi il bordo */
    padding: 10px 20px;
    /* Spaziatura interna del pulsante */
    border-radius: 5px;
    /* Bordi arrotondati */
    box-shadow: 0 0 20px #00ff00, 0 0 40px #00ff00, 0 0 60px #00ff00;
    /* Effetto ombra neon */
    transition: background-color 0.3s, box-shadow 0.3s;
    /* Transizioni per il cambio di colore di sfondo e l'effetto ombra */
    animation: neon 1.5s infinite alternate;
    /* Animazione neon */

}

@keyframes neon {
    0% {
        opacity: 0.5;
    }

    100% {
        opacity: 1;
    }
}

.btn-neon:hover {
    background-color: #333;
    /* Cambia il colore di sfondo a grigio scuro quando passi sopra */
    box-shadow: none;
    /* Rimuovi l'effetto ombra quando passi sopra */
}

/* Aggiungi qui altri stili personalizzati */
</style>
<script
    src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
</head>
<body>

<div id="particles-js"></div>

<div class="menu-container">
    <div class="menu">
        <h1>Menu</h1>
        <div id="errorMessage" style="color: red; display: none;">Seleziona almeno un'opzione.</div>
        <form action="myServlet" method="post" onsubmit="return validateForm()">
            <%
            Object vociMenuObject = request.getAttribute("vociMenu");
            if (vociMenuObject instanceof java.util.Map) {
                @SuppressWarnings("unchecked")
                java.util.Map<String, String> vociMenu = (java.util.Map<String, String>) vociMenuObject;
                for (java.util.Map.Entry<String, String> voce : vociMenu.entrySet()) {
            %>
            <label> <input type="radio" name="menuChoice"
                value="<%=voce.getKey()%>"> <%=voce.getValue()%>
            </label><br>
            <%
            }
            }
            %>
            <input type="submit" value="Invia" class="btn btn-primary btn-neon" style="width: 100%;" >
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
particlesJS.load('particles-js', 'particles.json', function() {
    console.log('callback - particles.js config loaded');
});

function validateForm() {
    var radioButtons = document.querySelectorAll('input[type="radio"]');
    var hasSelection = false;

    for (var i = 0; i < radioButtons.length; i++) {
        if (radioButtons[i].checked) {
            hasSelection = true;
            break;
        }
    }

    if (!hasSelection) {
        document.getElementById("errorMessage").style.display = "block";
        return false; // Prevent form submission
    } else {
        document.getElementById("errorMessage").style.display = "none";
        return true; // Allow form submission
    }
}
</script>
<!-- Altri script JS se necessario -->

</body>
</html>
