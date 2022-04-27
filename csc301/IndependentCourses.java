package csc301;

import algs4.BreadthFirstPaths;
import algs4.DepthFirstDirectedPaths;
import algs4.DepthFirstOrder;
import algs4.DepthFirstPaths;
import algs4.Digraph;
import algs4.DirectedCycle;
import algs4.Graph;
import algs4.In;
import algs4.StdIn;
import algs4.Topological;
import myalgs4.AVLTreeST;
import stdlib.StdOut;
public class IndependentCourses {

	public static void main(String[] args) {
		StdOut.println("Nikhil Bhalala***");
		StdIn.fromFile("datacsc301/courses.txt");
		AVLTreeST<String,Integer> courses  = new AVLTreeST<>();

		String[] line = StdIn.readAllStrings();
		for(int i=0; i< line.length; i++) {
			//StdOut.println(line[i]);
			courses.put(line[i],i );


		}
		Digraph g  =new Digraph(courses.size());

		StdIn.fromFile("datacsc301/prereqs.txt");
		String[] lines = StdIn.readAllLines();
		for(int i=0 ; i< lines.length ; i++) {
			String [] words = lines[i].split("\\s+");
			//StdOut.println(words[0]+"  " +  words[1]);
			int v = courses.get(words[0]);
			int w = courses.get(words[1]);
			g.addEdge(v, w);
			StdOut.println(g);


		}
		int count =0;
		DirectedCycle finder = new DirectedCycle(g);
		if (!finder.hasCycle()) { // If G is a DAG
			System.out.println("This directed graph is a DAG!");
			DepthFirstDirectedPaths dfs = new DepthFirstDirectedPaths(g ,count);
			StdIn.fromFile("datacsc301/independence.txt");
			while (!StdIn.isEmpty()) {
				String l = StdIn.readLine();
				String[] wo = l.split("\s+"); 
				if (dfs.hasPathTo(courses.get(wo[0])) != dfs.hasPathTo(courses.get(wo[1]))) {
					System.out.println("Independent");
					System.out.println(wo[0] + " --> " + wo[1]);
				} else {
					System.out.println("Dependent");
					System.out.println(wo[0] +  " --> " + wo[1]);
				} 
			}
		}
		else if(finder.hasCycle()) {
			System.out.println("This directed graph is NOT a DAG!");    
		}

	}


}




