package csc301;

import algs4.StdIn;
import stdlib.StdOut;

public class TestDNASequences {

	public static void main(String[] args) {
		//DNASequences Dna_seq= new DNASequences();
		StdOut.println("Nikhil Bhalala***");
		 StdIn.fromFile("datacsc301/mammals.txt");
		 number_species();
		 //listofSpeciesAndSeq() ;
		 delete_species();
		
	}
	
	public static void number_species() {
		DNASequences Dna_seq= new DNASequences();
		while (!StdIn.isEmpty()) {
			String line = StdIn.readLine();
			String[] fields = line.split("\\t");
			String species = fields[0];
			String sequence = String.valueOf(fields[1]);
			
			//StdOut.println(species);
			//StdOut.println(" ");
			//StdOut.println(sequence);
									
			Dna_seq.addSpecies(species, sequence);
		
			}
		 
			StdOut.println("The Number of Species in the object are: "+ Dna_seq.size());
			int count= 0;
			
			while(count<Dna_seq.speciesList().size()-1 ) {
				StdOut.println("Sepcies: "+ Dna_seq.speciesList().get(count++));
				
				String species = (String) Dna_seq.speciesList().get(count);
				StdOut.println("First 20 characters of its Genetic Sequence: " + Dna_seq.sequence(species ).substring(0, 20));
			}
		}
	
	public static void delete_species() {
		 DNASequences Dna_seq= new DNASequences();
		while (!StdIn.isEmpty()) {
		String line = StdIn.readLine();
		String[] fields = line.split("\\t");
		String species = fields[0];
		String sequence = String.valueOf(fields[1]);
		
		//StdOut.println(species);
		//StdOut.println(" ");
		//StdOut.println(sequence);
								
		//Dna_seq.addSpecies(species, sequence);
		Dna_seq.removeSpecies(species);
		}
		
		StdOut.println("The Number of Species in the object are: "+ Dna_seq.size());
		
	}
	}

	
