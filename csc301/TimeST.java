package csc301;

import algs4.Merge;
import algs4.SeparateChainingHashST;
import algs4.Stopwatch;
import myalgs4.AVLTreeST;
import myalgs4.BSTEssential;
import stdlib.StdIn;
import stdlib.StdOut;

public class TimeST {

	public static void main(String[] args) {
		StdOut.println("Nikhil Bhalala***");
		StdIn.fromFile("data/tale.txt");
		String[] words = StdIn.readAllStrings();
		//BSTEssential<String, Integer> bstTime = new BSTEssential<>();
		//AVLTreeST<String, Integer> AvlTime =new AVLTreeST<>();
		//SeparateChainingHashST<String, Integer> hashStTime=new SeparateChainingHashST<>();
		//Stopwatch time;
		//time= new Stopwatch();
		StdOut.println("=== Times with original ordering ===");
		BstTime(words);
		Avl_Time(words);
		sep_Chaining_Hash_St(words);
		StdOut.println("=== Times with sorted ordering === ");
		BstTime_sort(words);
		Avl_Time_sort(words);
		sep_Chaining_Hash_St_sort(words);
	
		
	}
	public static void BstTime(String[]words) {
		BSTEssential<String, Integer> bstTime = new BSTEssential<>();
		Stopwatch time;
		time= new Stopwatch();
		
		
		for (String word: words) {
			Integer count = bstTime.get(word);
			if (count == null) count = 0;
			bstTime.put(word, count+1);
		}
	
		StdOut.println("BST time: "+ time.elapsedTime());
	}
	public static void BstTime_sort(String[]words) {
		BSTEssential<String, Integer> bstTime = new BSTEssential<>();
		Merge.sort(words);
		Stopwatch time;
		time= new Stopwatch();
		
		
		for (String word: words) {
			Integer count = bstTime.get(word);
			if (count == null) count = 0;
			bstTime.put(word, count+1);
		}
	
		StdOut.println("BST time: "+ time.elapsedTime());
	}
	public static void Avl_Time (String[]words) {
		AVLTreeST<String, Integer> AvlTime =new AVLTreeST<>();
		Stopwatch time;
		time= new Stopwatch();
		for (String word: words) {
			Integer count =AvlTime.get(word);
			if (count == null) count = 0;
			AvlTime.put(word, count+1);
		}
		StdOut.println("AVL time:"+  time.elapsedTime());
		
		
		
	}
	public static void Avl_Time_sort (String[]words) {
		AVLTreeST<String, Integer> AvlTime =new AVLTreeST<>();
		Merge.sort(words);
		Stopwatch time;
		time= new Stopwatch();
		for (String word: words) {
			Integer count =AvlTime.get(word);
			if (count == null) count = 0;
			AvlTime.put(word, count+1);
		}
		StdOut.println("AVL time:"+  time.elapsedTime());
		
		
		
	}
	public static void sep_Chaining_Hash_St(String[]words) {
		SeparateChainingHashST<String, Integer> hashStTime=new SeparateChainingHashST<>();
		Stopwatch time;
		time= new Stopwatch();
		for (String word: words) {
			Integer count =hashStTime.get(word);
			if (count == null) count = 0;
			hashStTime.put(word, count+1);
		}
		StdOut.println("SCHT time:"+  time.elapsedTime());
		
	}
	public static void sep_Chaining_Hash_St_sort(String[]words) {
		SeparateChainingHashST<String, Integer> hashStTime=new SeparateChainingHashST<>();
		Merge.sort(words);
		Stopwatch time;
		time= new Stopwatch();
		for (String word: words) {
			Integer count =hashStTime.get(word);
			if (count == null) count = 0;
			hashStTime.put(word, count+1);
		}
		StdOut.println("SCHT time:"+  time.elapsedTime());
		
	}


}
