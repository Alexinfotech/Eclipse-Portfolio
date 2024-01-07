package it.molinari.controller.model;

// Classe astratta Persona che implementa l'interfaccia PersoneScuolaInterface
public abstract class Persona implements PersoneScuolaInterface {
    // Attributi protetti della classe
    protected String nome;
    protected String cognome;
    protected String codiceFiscale;

    // Costruttore della classe
    public Persona(String nome, String cognome, String codiceFiscale) {
        this.nome = nome;
        this.cognome = cognome;
        this.codiceFiscale = codiceFiscale;
    }

    // Metodo astratto da implementare nelle classi derivate per generare una stringa JSON
    public abstract String toJsonString();

    // Attributo aggiuntivo per gestire il tipo di utente (studente, professore, ecc.)
    private String tipoUtente;

    // Metodo getter per ottenere il tipo di utente
    public String getTipoUtente() {
        return tipoUtente;
    }

    // Metodo setter protetto per impostare il tipo di utente
    protected void setTipoUtente(String tipoUtente) {
        this.tipoUtente = tipoUtente;
    }

    // Metodi getter e setter per nome, cognome e codice fiscale
    public String getNome() {
        return nome;
    }
 // Metodo setter per 'nome'. Imposta il valore del nome della persona.
    public void setNome(String nome) {
        this.nome = nome;
    }

    // Metodo getter per 'cognome'. Restituisce il cognome della persona.
    public String getCognome() {
        return cognome;
    }

    // Metodo setter per 'cognome'. Imposta il valore del cognome della persona.
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    // Metodo getter per 'codiceFiscale'. Restituisce il codice fiscale della persona.
    public String getCodiceFiscale() {
        return codiceFiscale;
    }

    // Metodo setter per 'codiceFiscale'. Imposta il valore del codice fiscale della persona.
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }
}