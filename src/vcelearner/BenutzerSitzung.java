/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vcelearner;

import java.util.ArrayList;

/**
 *
 * @author J.Bleich
 */
public class BenutzerSitzung {
    private int zeitVorgabe;
    private Benutzer benutzer;
    private ArrayList<SitzungsLernKarte> sLKs;

    public BenutzerSitzung(int zeitVorgabe, Benutzer benutzer, 
            ArrayList<LernKarte> lKs) {
        this.zeitVorgabe = zeitVorgabe;
        this.benutzer = benutzer;
        sLKs= new ArrayList<>();
        for (LernKarte lK : lKs) {
            this.sLKs.add(new SitzungsLernKarte(lK));
        }
    }

    public int getZeitVorgabe() {
        return zeitVorgabe;
    }

    public Benutzer getBenutzer() {
        return benutzer;
    }

    public ArrayList<SitzungsLernKarte> getsLKs() {
        return sLKs;
    }
    
}
