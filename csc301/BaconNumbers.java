package csc301;

import algs4.BreadthFirstPaths;
import algs4.Graph;
import algs4.In;
import algs4.StdIn;
import myalgs4.AVLTreeST;
import stdlib.StdOut;

public class BaconNumbers {

	public static void main(String[] args) {
		StdOut.println("Nikhil Bhalala***");
		In in= new In ("datacsc301/KBgraph.txt");
		Graph g =new Graph(in);
		
		
		
		AVLTreeST<Integer, String> bacon_1= new AVLTreeST<>();
		A4BSTEssential<String,Integer> bacon_2  = new A4BSTEssential<>();
		
		
		  StdIn.fromFile("datacsc301/KBgraphActors.txt"); 
		  int count =0;
		  while (!StdIn.isEmpty()) {
		  String line = StdIn.readLine(); 
		  //StdOut.println(count++ +"  "+ words[0]); //StdOut.println();
		  
		  bacon_1.put(count++, line);
		  bacon_2.put(line,count-1 );
		  }
			/*
			 * for(Integer k:bacon_1.keys()) { StdOut.println(k+ ":"+ bacon_1.get(k));
			 * 
			 * 
			 * }
			 * 
			 * StdOut.println("*********************************");
			 * 
			 * for(String k:bacon_2.keys()) { StdOut.println(k+ ":"+ bacon_2.get(k))
			 * 
			 * 
			 * }
			 */
		  StdOut.println("*********************************");
		  
		  BreadthFirstPaths bsp = new BreadthFirstPaths( g, 0 );
		  
		 
		  for(String k:bacon_2.keys())
		  { 
		  	 StdOut.print(" ");
			 for(Integer x: bsp.pathTo(bacon_2.get(k))) {
				 
				 //String h=String.format(" %s",bacon_1.get(x));
				 StdOut.print( bacon_1.get(x)+ "--->>")  ;
				 //StdOut.print(" ");
			 } StdOut.println(k+ ": "+  bsp.distTo(bacon_2.get(k)));
		  }
		 
		  
			 }
	

}
