<!DOCTYPE html>
<html>
<head>
<title>Crea Nuovo Utente</title>
<!-- Collega il CSS di Bootstrap per lo styling della pagina -->


<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Stili CSS personalizzati per la pagina -->

<style>
/* Stili di base per il body e html */
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: Arial, sans-serif;
}
/* Stili per l'effetto particelle in background */
#particles-js {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #6c757d;
	top: 0;
	left: 0;
	z-index: -1;
}
/* Stili per il contenitore del form e per il form stesso */
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
	width: 100%;
}

h2 {
	margin-bottom: 30px;
}

form {
	display: inline-block;
	text-align: left;
	color: white;
}
/* Stili per gli input e i bottoni */
input[type="text"], select {
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	padding: 10px;
	width: calc(100% - 22px);
}

.btn-neon {
	margin-top: 20px;
	padding: 10px 20px;
	border-radius: 5px;
	border: none;
	background-color: #00ff00;
	color: white;
	cursor: pointer;
	box-shadow: 0 0 20px #00ff00, 0 0 40px #00ff00, 0 0 60px #00ff00;
	transition: background-color 0.3s, box-shadow 0.3s;
	animation: neon 1.5s infinite alternate;
}

.btn-neon-red {
	margin-top: 20px;
	padding: 10px 20px;
	border-radius: 5px;
	border: none;
	background-color: #ff0000;
	color: white;
	cursor: pointer;
	box-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000, 0 0 60px #ff0000;
	transition: background-color 0.3s, box-shadow 0.3s;
	animation: neon 1.5s infinite alternate;
}
/* Animazioni per gli effetti dei bottoni neon */
@
keyframes neon { 0% {
	opacity: 0.5;}
100%{
opacity:1;}
}
/* Stili per l'hover sui bottoni neon */
.btn-neon:hover, .btn-neon-red:hover {
	background-color: #333;
	box-shadow: none;
}
</style>
<!-- Collegamento alla libreria Particles.js -->

<script
	src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
</head>
<body>
	<!-- Effetto particelle in background -->

	<div id="particles-js"></div>
	<!-- Contenitore principale per il form di inserimento utente -->

	<div class="user-form-container">
		<div class="user-form">
			<h2>Inserisci i dati per il nuovo utente</h2>
			<!-- Form per la creazione di un nuovo utente -->

			<form action="myServlet" method="post">
				<label for="tipoUtente">Tipo di utente:</label> <select
					name="tipoUtente" id="tipoUtente">
					<option value="studente">Studente</option>
					<option value="professore">Professore</option>
					<option value="commesso">Commesso</option>
				</select><br> <label for="nome">Nome:</label> <input type="text"
					id="nome" name="nome"><br> <label for="cognome">Cognome:</label>
				<input type="text" id="cognome" name="cognome"><br> <label
					for="codiceFiscale">Codice Fiscale:</label> <input type="text"
					id="codiceFiscale" name="codiceFiscale"><br> <input
					type="hidden" name="menuChoice" value="salvaUtente"> <input
					type="submit" value="Crea Utente" class="btn-neon"
					style="width: 93%;">
			</form>
			<!-- Form per tornare al menu principale -->

			<form action="myServlet" method="get">
				<input type="hidden" name="menuChoice" value="tornaAlMenu">
				<input type="submit" value="Torna al Menu" class="btn-neon-red">
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

