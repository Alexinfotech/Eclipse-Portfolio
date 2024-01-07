package it.molinari.controller.model;

public class Commesso extends Persona {


	public Commesso(String nome, String cognome, String codiceFiscale) {
		super(nome, cognome, codiceFiscale);
	}

	@Override
	public String toJsonString() {
		return "{\"tipo\": \"Commesso\", \"nome\": \"" + getNome() + "\", \"cognome\": \"" + getCognome()
				+ "\", \"codiceFiscale\": \"" + getCodiceFiscale() + "\"}";
	}

	/*
	 * @Override public String toXMLString() { return "<commesso><nome>" + getNome()
	 * + "</nome><cognome>" + getCognome() + "</cognome><codiceFiscale>" +
	 * getCodiceFiscale() + "</codiceFiscale></commesso>"; }
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
