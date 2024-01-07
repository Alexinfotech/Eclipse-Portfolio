package it.molinari.controller;

import java.io.IOException;
import java.util.HashMap;

import it.molinari.controller.model.Persona;
import it.molinari.controller.model.Professore;
import it.molinari.controller.model.Studente;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/myServlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Servlet() {
        // Costruttore vuoto della Servlet
    }

    // Metodo doGet per gestire le richieste GET alla Servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Creazione di una mappa per gestire le voci del menu
        HashMap<String, String> vociMenu = new HashMap<>();
        vociMenu.put("1", "Crea utente");
        vociMenu.put("2", "Visualizza utente");
        vociMenu.put("3", "Controllo per codice fiscale");
        vociMenu.put("4", "Esci");

        // Imposta la mappa come attributo della richiesta
        request.setAttribute("vociMenu", vociMenu);
        // Inoltra la richiesta al JSP del menu
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/menu.jsp");
        dispatcher.forward(request, response);
    }

    // Metodo doPost per gestire le richieste POST alla Servlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera la scelta del menu dall'utente
        String menuChoice = request.getParameter("menuChoice");

        // Controlla se la scelta del menu è nulla e gestisce l'errore
        if (menuChoice == null) {
            request.setAttribute("message", "Scelta non valida.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/menu.jsp");
            dispatcher.forward(request, response);
            return; // Termina il metodo per prevenire ulteriori esecuzioni
        }

        RequestDispatcher dispatcher;

        // Gestisce le varie scelte dell'utente
        switch (menuChoice) {
            case "1": // Gestisce la creazione di un nuovo utente
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/creaUtente.jsp");
                dispatcher.forward(request, response);
                break;
            case "salvaUtente": // Gestisce il salvataggio di un nuovo utente
                // Raccoglie i dati dell'utente dal form
                String tipoUtente = request.getParameter("tipoUtente");
                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String codiceFiscale = request.getParameter("codiceFiscale");

                // Ottiene l'istanza di GestoreDati e salva l'utente
                GestoreDati gestore = GestoreDati.getInstance();
                if ("studente".equalsIgnoreCase(tipoUtente)) {
                    Studente studente = new Studente(nome, cognome, codiceFiscale);
                    gestore.salvaPersona(codiceFiscale, studente);
                } else if ("professore".equalsIgnoreCase(tipoUtente)) {
                    String materia = request.getParameter("materia");
                    Professore professore = new Professore(nome, cognome, codiceFiscale, materia);
                    gestore.salvaPersona(codiceFiscale, professore);
                }
                // Gestisce la conferma del salvataggio
                String conferma = gestore.confermaSalvataggioDati(codiceFiscale);
                request.setAttribute("message", conferma);
                request.setAttribute("codiceFiscaleInserito", codiceFiscale);
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/PersonaInserita.jsp");
                dispatcher.forward(request, response);
                break;
            case "2": // Visualizza utente
                // Implementazione futura per la visualizzazione di un utente specifico
                break;
            case "3": // Ricerca per codice fiscale
                // Ottiene il codice fiscale inserito dall'utente per la ricerca
                String codiceFiscaleRicerca = request.getParameter("codiceFiscaleRicerca");

                // Controlla se il codice fiscale è stato fornito
                if (codiceFiscaleRicerca == null) {
                    // Se non è fornito, reindirizza al form di ricerca per il codice fiscale
                    dispatcher = request.getRequestDispatcher("/WEB-INF/views/ControlloCodiceFiscale.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // Ottiene l'istanza di GestoreDati per accedere ai dati salvati
                    GestoreDati gestoredati = GestoreDati.getInstance();
                    // Cerca la persona utilizzando il codice fiscale fornito
                    Persona personaRicercata = gestoredati.trovaPersona(codiceFiscaleRicerca);

                    // Verifica se è stata trovata una persona corrispondente
                    if (personaRicercata != null) {
                        // Se trovata, imposta la persona come attributo della richiesta
                        request.setAttribute("personaRicercata", personaRicercata);
                        // Reindirizza alla pagina di visualizzazione dei risultati
                        dispatcher = request.getRequestDispatcher("/WEB-INF/views/RisultatoRicerca.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Se non trovata, imposta un messaggio di errore
                        request.setAttribute("messaggioErrore", "Persona non trovata.");
                        // Reindirizza alla pagina di errore
                        dispatcher = request.getRequestDispatcher("/WEB-INF/views/errore.jsp");
                        dispatcher.forward(request, response);
                    }
                }
                break;

            case "4": // Esci
                // Reindirizza l'utente alla pagina iniziale
                response.sendRedirect("index.html");
                break;

            default:
                // Gestisce il caso in cui la scelta non corrisponde a nessuna opzione valida
                request.setAttribute("message", "Scelta non valida.");
                // Reindirizza all'interfaccia del menu
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/menu.jsp");
                dispatcher.forward(request, response);
                break;
        }
    }
}
