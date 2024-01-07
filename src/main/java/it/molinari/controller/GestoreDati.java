package it.molinari.controller;

import it.molinari.controller.model.Persona;
import java.util.HashMap;
import java.util.Map;

public class GestoreDati {
    // un'unica istanza di questa classe sarà creata.
    private static GestoreDati instance;
    // HashMap per memorizzare oggetti Persona usando il codice fiscale come chiave.
    private Map<String, Persona> datiSalvati;

    // Costruttore privato per impedire l'istanziazione dall'esterno della classe.
    private GestoreDati() {
        datiSalvati = new HashMap<>();
    }

    // Metodo statico per ottenere l'istanza.
    // Se l'istanza non esiste, ne crea una nuova.
    public static synchronized GestoreDati getInstance() {
        if (instance == null) {
            instance = new GestoreDati();
        }
        return instance;
    }

    // Metodo per salvare un oggetto Persona nel HashMap.
    // Usa il codice fiscale come chiave e l'oggetto Persona come valore.
    public void salvaPersona(String codiceFiscale, Persona persona) {
        datiSalvati.put(codiceFiscale, persona);
    }

    // Metodo per trovare una Persona usando il codice fiscale.
    // Restituisce l'oggetto Persona se presente, altrimenti null.
    public Persona trovaPersona(String codiceFiscale) {
        return datiSalvati.get(codiceFiscale);
    }

    // Metodo per confermare il salvataggio dei dati.
    // Controlla se il codice fiscale è presente nel HashMap e restituisce un messaggio appropriato.
    public String confermaSalvataggioDati(String codiceFiscale) {
        if (datiSalvati.containsKey(codiceFiscale)) {
            return "Dati salvati con successo!";
        } else {
            return "Errore nel salvataggio dei dati.";
        }
    }

    // Metodo per verificare la presenza di un codice fiscale nel HashMap.
    // Restituisce true se il codice fiscale è presente, altrimenti false.
    public boolean verificaCodiceFiscale(String codiceFiscale) {
        return datiSalvati.containsKey(codiceFiscale);
    }

}
