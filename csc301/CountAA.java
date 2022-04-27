package csc301;

import algs4.BST;
import algs4.StdIn;
import myalgs4.BSTEssential;
import stdlib.StdOut;

public class CountAA {

	public static void main(String[] args) {
		BSTEssential<String,String> dna2 = new BSTEssential<>();
		StdOut.println("Nikhil Bhalala***");
		StdIn.fromFile("datacsc301/DNAtoAA.txt");
		while (!StdIn.isEmpty()) {
			String line = StdIn.readLine();
			String[] words = line.split(" ");
			//StdOut.println(words[0] +"  "+  words[1]);
			//StdOut.println();
			
			dna2.put(words[0], words[1]);


		

	}
	
	  StdIn.fromFile("datacsc301/sequence2.txt");
	  String words = StdIn.readAll();
	  BSTEssential<String,Integer> dna3 = new BSTEssential<>();
	  for(int i=0; i<words.length()-3;i+=3) {
		  String w=words.substring(i,i+3);
		  String w1= dna2.get(w);
		  //StdOut.println(w1);
		  
		  Integer count = dna3.get(w1);
		  if (count == null) count = 0;
		  dna3.put(w1, count+1);
		  
		  }
	  for(String k:dna3.keys()) {
		  StdOut.println(k+ ":"+ dna3.get(k));
		  
		  
	  }
	  
	  
	  
			
		  
		  
			
		  
		  
	  
	  
			

	}

}
