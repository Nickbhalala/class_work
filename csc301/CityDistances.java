package csc301;

import algs4.BreadthFirstPaths;
import algs4.Graph;
import algs4.StdIn;
import myalgs4.AVLTreeST;
import stdlib.StdOut;

public class CityDistances {

	public static void main(String[] args) {
		
		StdIn.fromFile("datacsc301/fecities.txt");
		AVLTreeST<String,Integer> cities  = new AVLTreeST<>();

		String[] line = StdIn.readAllStrings();
		for(int i=0; i< line.length; i++) {
			//StdOut.println(line[i]);
			cities.put(line[i],i );


		}
		StdIn.fromFile("datacsc301/femajorcities.txt");
		String[] majorCities = StdIn.readAllLines();
		Graph g =new Graph(cities.size());
		for(int i=0 ; i< line.length ; i++) {
			int v= cities.get(line[i]);
			g.degree(v);

		}
		StdIn.fromFile("datacsc301/feconnections.txt");
		String[] lines1 = StdIn.readAllLines();
		for(int i=0 ; i< lines1.length ; i++) {
			String [] words = lines1[i].split("\\s+");
			//StdOut.println(words[0]+"  " +  words[1]);
			int v = cities.get(words[0]);
			int w = cities.get(words[1]);
			g.addEdge(v, w);
			//StdOut.println(g);
		}
		StdOut.printf("%20s", "");
		for (String majorCity: majorCities) {
			StdOut.printf("%-12s", majorCity);
		}
		StdOut.println();

		for(String k:cities.keys()) {

			StdOut.printf(k,"%3d");
			StdOut.printf("%20s","");
			for (String majorCity: majorCities) {

				BreadthFirstPaths bsp = new BreadthFirstPaths( g,cities.get(k) );



				StdOut.printf("%-12s",bsp.distTo(cities.get(majorCity)));

			}StdOut.println();}
		
		





	}

}
