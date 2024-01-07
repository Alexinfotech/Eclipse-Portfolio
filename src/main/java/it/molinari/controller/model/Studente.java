package it.molinari.controller.model;

public class Studente extends Persona {

	public Studente(String nome, String cognome, String codiceFiscale) {
		super(nome, cognome, codiceFiscale);
		this.setTipoUtente("Studente");

	}

	@Override
	public String toJsonString() {
		return "{\"tipo\": \"Studente\", \"nome\": \"" + getNome() + "\", \"cognome\": \"" + getCognome()
				+ "\", \"codiceFiscale\": \"" + getCodiceFiscale() + "\"}";
	}

	/*
	 * @Override public String toXMLString() { return "<studente><nome>" + getNome()
	 * + "</nome><cognome>" + getCognome() + "</cognome><codiceFiscale>" +
	 * getCodiceFiscale() + "</codiceFiscale></studente>"; }
	 */
	@Override
	public void entrata() {
		// TODO Auto-generated method stub

	}

	@Override
	public void uscita() {
		// TODO Auto-generated method stub

	}
}
// Qui posso aggiungere eventuali metodi specifici
// per la classe Studente che dipnderanno dal progetto
