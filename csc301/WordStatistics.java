package csc301;

import algs4.Merge;
import algs4.Stopwatch;
import stdlib.StdIn;
import stdlib.StdOut;

public class WordStatistics {

	public static void main(String[] args) {
		StdOut.println("Nikhil Bhalala");
		StdOut.println("***");
		StdIn.fromFile("data/tale.txt");
		String[] words = StdIn.readAllStrings();
		StdOut.println( "Average Lengtht Words is " + averageLengthtWords(words));
		sorts(words);
		StdOut.println(longestWord(words));
		

	}
	public static String longestWord(String[]words) {
		int longestwordLength = 0;
		for (String word: words) {
			if (word.length() > longestwordLength) {
				longestwordLength = word.length();
			}
		}
		
		return("The longest word contained " + longestwordLength + " letter.");
		
	}
	public static float averageLengthtWords(String[]words) {
		float count =0;
		
		for (String word:words) {
			int w= word.length();
			count+=w;
		
		
		}
		float average=  count /words.length;
		return  average;
		
		//double average= words.length/2;
		
		
		
	}
	public static void sorts(String[]words) {
		 Merge.sort(words);
		 
		 StdOut.println("The alphabetically first  word is "+  words[0]);
		 StdOut.println("The alphabetically last  word is "+  words[words.length-1]);
		 
	}
		

}
