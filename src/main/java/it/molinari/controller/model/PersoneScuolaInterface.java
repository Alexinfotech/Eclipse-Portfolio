package it.molinari.controller.model;

// Interfaccia PersoneScuolaInterface
public interface PersoneScuolaInterface {

    // Metodo astratto 'entrata'.
    // Questo metodo sarà implementato dalle classi che rappresentano persone nella scuola
    // per gestire le azioni relative all'entrata.
    void entrata();

    // Metodo astratto 'uscita'.
    // Questo metodo sarà implementato dalle classi che rappresentano persone nella scuola
    // per gestire le azioni relative all'uscita.
    void uscita();

    // Metodo astratto 'toJsonString'.
    // Questo metodo sarà implementato dalle classi che rappresentano persone nella scuola
    // per fornire una rappresentazione in formato JSON dell'oggetto.
    String toJsonString();

}
