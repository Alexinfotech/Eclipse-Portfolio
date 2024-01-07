package it.molinari.controller.model;

// Classe Professore che estende la classe astratta Persona
public class Professore extends Persona {
    // Attributo privato per la materia insegnata dal professore
    private String materia;

    // Costruttore della classe Professore
    public Professore(String nome, String cognome, String codiceFiscale, String materia) {
        super(nome, cognome, codiceFiscale); // Chiamata al costruttore della superclasse Persona
        this.setTipoUtente("Professore"); // Imposta il tipo di utente come "Professore"

        this.materia = materia; // Imposta la materia insegnata
    }

    // Metodo getter per ottenere la materia insegnata
    public String getMateria() {
        return materia;
    }

    // Metodo setter per impostare la materia insegnata
    public void setMateria(String materia) {
        this.materia = materia;
    }

    // Implementazione del metodo astratto toJsonString
    // Crea una rappresentazione in formato JSON dell'oggetto Professore
    @Override
    public String toJsonString() {
        return "{\"tipo\": \"Professore\", \"nome\": \"" + getNome() + "\", \"cognome\": \"" + getCognome()
                + "\", \"codiceFiscale\": \"" + getCodiceFiscale() + "\", \"materia\": \"" + materia + "\"}";
    }

    // Implementazione del metodo astratto entrata
    // Gestisce le azioni all'entrata del professore (da implementare)
    @Override
    public void entrata() {
        // TODO: Implementare le azioni specifiche all'entrata del professore
    }

    // Implementazione del metodo astratto uscita
    // Gestisce le azioni all'uscita del professore (da implementare)
    @Override
    public void uscita() {
        // TODO: Implementare le azioni specifiche all'uscita del professore
    }
}

/*
 * @Override public String toXMLString() { return "<professore><nome>" +
 * getNome() + "</nome><cognome>" + getCognome() + "</cognome><codiceFiscale>" +
 * getCodiceFiscale() + "</codiceFiscale><materia>" + materia +
 * "</materia></professore>"; }
 */
