/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MemoryUser;

import java.util.Hashtable;

/**
 *
 * @author stephane.grangier
 */
public class Scores {

    public static Hashtable<String, Integer> scores = null;

    public static void initilisation() {
        if (scores == null) {
            scores = new Hashtable<String, Integer>();
            scores.put("termine", 48);
            scores.put("daucourt", 50);
            scores.put("francillon", 55);
            scores.put("dupont", 60);
            scores.put("t", 12);
        }
    }

    public static void modifieScore(String user, Integer points) {
        Integer scoreActuel = scores.get(user);
        Integer scoreNouveau = scoreActuel + points;

        if (scoreNouveau < 0) {
            scoreNouveau = 0;
        }

        scores.replace(user, scoreNouveau);

    }
    
    
    public Hashtable<String, Integer> podium(String user) {
        Hashtable<String, Integer> podium;
        podium = new Hashtable<String, Integer>();
        
            

        return null; //podium;

    }
    
    

   
}
