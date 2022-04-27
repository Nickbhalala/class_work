package csc301;
import myalgs4.BSTEssential;
import algs4.StdIn;
import stdlib.StdOut;
//import algs4.SequentialSearchST;
public class TranlateToAAv2 {

	public static void main(String[] args) {
		BSTEssential<String, String> dna2 = new BSTEssential<>();
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
	  
	  for(int i=0; i<words.length()-3;i+=3) {
		  String w=words.substring(i,i+3);
		  StdOut.print(dna2.get(w));
		  
		  
	  }
	  
	  
	  
		  
	
	  
	  
	
		   
		 
			  
		
		
		
	}
	
	
	 
	

}
