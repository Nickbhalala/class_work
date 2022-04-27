package csc301;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import myalgs4.AVLTreeST;
import stdlib.StdOut;

public class DNASequences {
	
	private AVLTreeST<String, String> Dna;
	 
	public DNASequences () {
		Dna = new AVLTreeST<>();
		
	}
	public void addSpecies(String species, String sequence) {
	  Dna.put(species, sequence);
	}
	public void removeSpecies(String species) {
		Dna.delete(species);
		
		
	}
	public ArrayList speciesList() {
		
		ArrayList<String>sepcies =sepcies= new ArrayList<>();
		
		for(String k:Dna.keys()) {
			sepcies.add(k);
		
			  
		  }Collections.sort(sepcies);
			return ( sepcies);
	 	
	}
	public String sequence(String species) {
		return Dna.get(species);
		}
	
	public int size() {
		
		
		return Dna.size();
	}
	

}
