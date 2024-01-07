<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.molinari.controller.model.Persona"%>
<%@ page import="it.molinari.controller.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Persona Inserita</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Stili aggiuntivi */
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
            top: 0;
            left: 0;
            z-index: -1;
            background-color: #6c757d; /* Sfondo grigio */
        }

        .person-summary-container {
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            text-align: center;
        }

        .person-summary {
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
            color: #555;
        }

        p.error-message {
            color: #ff0000; /* Colore rosso per il messaggio di errore */
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
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
    </style>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
</head>
<body>

    <div id="particles-js"></div>

    <div class="person-summary-container">
        <div class="person-summary">
            <h2>Riepilogo Persona Inserita</h2>
            <%
                String codiceFiscale = (String) request.getAttribute("codiceFiscaleInserito");
                if (codiceFiscale != null) {
                    GestoreDati gestoreDati = GestoreDati.getInstance();
                    Persona persona = gestoreDati.trovaPersona(codiceFiscale);

                    if (persona != null) {
            %>
                        <p>Nome: <%= persona.getNome() %></p>
                        <p>Cognome: <%= persona.getCognome() %></p>
                        <p>Codice Fiscale: <%= persona.getCodiceFiscale() %></p>
                        <!-- Altri dettagli della persona se necessario -->
            <%
                    } else {
            %>
                        <p class="error-message">Errore: Nessuna persona trovata con il codice fiscale fornito.</p>
            <%
                    }
                } else {
            %>
                    <p class="error-message">Errore: Nessun codice fiscale fornito.</p>
            <%
                }
            %>
           <form action="myServlet" method="get">
                <input type="hidden" name="menuChoice" value="tornaAlMenu">
                <input type="submit" value="Torna al Menu" class="btn btn-neon">
            </form>
        </div>
    </div>

    <script>
        particlesJS('particles-js', {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: '#ff0000' }, /* Colore rosso per i segmenti in movimento */
                shape: { type: 'circle', stroke: { width: 0, color: '#000000' }, polygon: { nb_sides: 5 }, image: { src: 'img/github.svg', width: 100, height: 100 } },
                opacity: { value: 0.5, random: false, anim: { enable: false, speed: 1, opacity_min: 0.1, sync: false } },
                size: { value: 3, random: true, anim: { enable: false, speed: 40, size_min: 0.1, sync: false } },
                line_linked: { enable: true, distance: 150, color: '#333', opacity: 0.4, width: 1 },
                move: { enable: true, speed: 6, direction: 'none', random: false, straight: false, out_mode: 'out', bounce: false, attract: { enable: false, rotateX: 600, rotateY: 1200 } },
            },
            interactivity: {
                detect_on: 'canvas',
                events: { onhover: { enable: true, mode: 'repulse' }, onclick: { enable: true, mode: 'push' }, resize: true },
                modes: { grab: { distance: 400, line_linked: { opacity: 1 } }, bubble: { distance: 400, size: 40, duration: 2, opacity: 8, speed: 3 }, repulse: { distance: 200, duration: 0.4 }, push: { particles_nb: 4 }, remove: { particles_nb: 2 } },
            },
            retina_detect: true,
        });
    </script>

</body>
</html>
