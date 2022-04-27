package csc301;

import algs4.BreadthFirstPaths;
import algs4.Graph;
import algs4.In;
import stdlib.StdOut;

public class ShortestPaths {

	public static void main(String[] args) {
		StdOut.println("Nikhil Bhalala***");
		Graph g =new Graph(new In("datacsc301/KBgraph.txt"));
		BreadthFirstPaths bsp = new BreadthFirstPaths( g, 0 );
		for ( int v =0 ; v< g.V(); v++){
			 StdOut.println( " Number: "+ v + " Distance: "+  bsp.distTo(v) +  " Path: "+ bsp.pathTo(v) );
			
		}

	}

}
