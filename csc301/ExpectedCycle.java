package csc301;

import java.util.Random;

import algs4.Cycle;
import algs4.DepthFirstDirectedPaths;
import algs4.Digraph;
import algs4.DirectedCycle;
import algs4.Graph;
import stdlib.StdOut;

public class ExpectedCycle {

	public static void main(String[] args) {
		int[] n= { 4, 8, 16, 32, 64, 128, 256, 512,1024};
		for(int i: n) {
			Graph graph= new Graph(i);
			Cycle cycle = new Cycle(graph);
			while(!cycle.hasCycle()) {
				Random r= new Random();
				int v= r.nextInt(i-1);
				int w= r.nextInt(i-1);
				graph.addEdge(v, w);
				cycle= new Cycle(graph);
				
			}
			System.out.println("number of vertices:" +graph.V()  +" "+ "number of edges: " + graph.E());
			System.out.println( "Ratio : "+ " "+graph.V() /graph.E());
			
		}
		

		
		
			
		
		

	}

}
