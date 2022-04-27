package csc301;

import algs4.StdIn;
import algs4.StdOut;
import csc301.A4BSTEssential;

public class TestA4BSTEssential {

	public static void main(String[] args) {
		A4BSTEssential<String,Integer> countWord = new A4BSTEssential<>();
		StdOut.println("Nikhil Bhalala***");
		StdIn.fromFile("datacsc301/tinyTale.txt");
		while (!StdIn.isEmpty()) {
			String line = StdIn.readLine();
			String[] words = line.split(" ");
			
			//StdOut.println(words);
			
			for (String word: words) {
				Integer count = countWord.get(word);
				if (count == null) count = 0;
				countWord.put(word, count+1);
			}
			
		
			  
			  }
		StdOut.println(countWord.countValue(1) + " words that occur once");
		
			
				
				
			
			  
			  
			  
			 
			
		
	
		
			  
			  
		  }
		

	

}
