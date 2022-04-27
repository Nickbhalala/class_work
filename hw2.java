package algs11;

import java.util.Arrays;
import stdlib.*;

/**
 * This is a skeleton file for your homework. Edit the sections marked TODO. You
 * may add new functions. You may also edit the function "main" to test your
 * code.
 *
 * You must not add static variables. You MAY add static functions, just not
 * static variables.
 *
 * It is okay to add functions, such as
 *
 * <pre>
 *     public static double sumHelper (double[] list, int i, double sumSoFar) {
 * </pre>
 *
 * but it is NOT okay to add static variables, such as
 *
 * <pre>
 * public static int x;
 * </pre>
 *
 * As in homework 1,2 you must not change the declaration of any method.
 * 
 * You can edit the main function all you want. I will not run your main
 * function when grading.
 */
public class hw2 {

	/**
	 * As a model, here is a minValue function, both iteratively and recursively
	 */
	/** iterative version */
	public static double minValueI (double[] list) {
		double result = list[0];
		int i = 1;
		while (i < list.length) {
			if (list[i] < result) result = list[i];
			i = i + 1;
		}
		return result;
	}

	/** recursive version */
	public static double minValue (double[] list) {
		if ( list == null || list.length == 0 )
			return 0;
		
		return minValueHelper (list, 1, list[0]);
	}
	
	private static double minValueHelper (double[] list, int i, double result) 
	{
		// base case
		if ( list == null || list.length == 0 || i >= list.length )
			return result;
		
		if (list[i] < result) result = list[i];
		return minValueHelper (list, i + 1, result);
	}

	/**
	 * PROBLEM 1: Translate the following sum function from iterative to
	 * recursive.
	 *
	 * You should write a helper method. You may not use any "fields" to solve
	 * this problem (a field is a variable that is declared "outside" of the
	 * function declaration --- either before or after).
	 */
	public static double sumI (double[] a) {
		double result = 0.0;
		int i = 0;
		while (i < a.length) {
			result = result + a[i];
			i = i + 1;
		}
		return result;
	}
	public static double sum (double[] a) {
		return sumhelper(a,0,0.0);
		//return 0; // TODO
	}
	public static double sumhelper(double[]a ,int index ,double result) {
		if(index<a.length) {
			result=result+a[index];
			result=sumhelper(a,index+1,result);
			
		}
		return result;
		
	}

	/**
	 * PROBLEM 2: Do the same recursive translation for this in-place reverse function
	 *
	 * You should write a helper method. You may not use any "fields" to solve
	 * this problem (a field is a variable that is declared "outside" of the
	 * function declaration --- either before or after).
	 */
	public static void reverseI (double[] a) {
		int hi = a.length - 1;
		int lo = 0;
		while (lo < hi) {
			double loVal = a[lo];
			double hiVal = a[hi];
			a[hi] = loVal;
			a[lo] = hiVal;
			lo = lo + 1;
			hi = hi - 1;
		}
	}
	public static void reverse (double[] a) {
		reverseHelper(a,0,a.length-1);
		
		// TODO
	}
	public static void reverseHelper(double[]a,int fristindex, int leastindex) {
		if(fristindex<leastindex) {
			double num=a[fristindex];
			a[fristindex]=a[leastindex];
			a[leastindex]=num;
			
			//result= result+(a.length-1)/2;
			
			
			
			reverseHelper(a, fristindex+1,leastindex-1);
		}
		
		
		
		
		
		
	}

	/**
	 * PROBLEM 3: The following function draws mickey mouse, if you call it like
	 * this from main:
	 *
	 * <pre>
	 * draw (.5, .5, .25);
	 * </pre>
	 *
	 * Change the code to draw mickey moose instead. Your solution should be
	 * recursive.
	 * 
	 * Before picture: http://fpl.cs.depaul.edu/jriely/ds1/images/MickeyMouse.png
	 * After picture: http://fpl.cs.depaul.edu/jriely/ds1/images/MickeyMoose.png 
	 *
	 * You may not use any "fields" to solve this problem (a field is a variable
	 * that is declared "outside" of the function declaration --- either before
	 * or after).
	 */
	public static void draw (double centerX, double centerY, double radius) {
		if (radius < .0005) return;

		StdDraw.setPenColor (StdDraw.LIGHT_GRAY);
		StdDraw.filledCircle (centerX, centerY, radius);
		StdDraw.setPenColor (StdDraw.BLACK);
		StdDraw.circle (centerX, centerY, radius);
		

		double change = radius * 0.90;
		draw ( centerX-change,  centerY+change,  radius/2);
		
		
		StdDraw.setPenColor (StdDraw.LIGHT_GRAY);
		StdDraw.filledCircle (centerX+change, centerY+change, radius/2);
		StdDraw.setPenColor (StdDraw.BLACK);
		StdDraw.circle (centerX+change, centerY+change, radius/2);
		
		
		StdDraw.setPenColor (StdDraw.LIGHT_GRAY);
		StdDraw.filledCircle (centerX-change, centerY+change, radius/2);
		StdDraw.setPenColor (StdDraw.BLACK);
		StdDraw.circle (centerX-change, centerY+change, radius/2);
		draw ( centerX+change,  centerY+change,  radius/2);
		
		
	}
	

	/**
	 * PROBLEM 4: Run runTerribleLoop for one hour. You can stop the program using
	 * the red "stop" square in eclipse. Fill in the OUTPUT line below with the
	 * numbers you saw LAST --- edit the line, replacing the two ... with what
	 * you saw:
	 *
	 * OUTPUT: terribleFibonacci(...)=... // TODO terribleFibonacci(55)=139583862445;
	 *
	 * Comment: the code uses "long" variables, which are like "int", but
	 * bigger. It's because fibonacci numbers get really big really fast.
	 */
	public static void runTerribleLoop () {
		for (int N = 0; N < 100; N++)
			StdOut.format ("terribleFibonacci(%2d)=%d\n", N, terribleFibonacci (N));
	}
	public static void runTerribleSomeValues () {
		StdOut.format ("terribleFibonacci(%2d)=%d\n", 13, terribleFibonacci (13));
		StdOut.format ("terribleFibonacci(%2d)=%d\n", 7,  terribleFibonacci (7));
		StdOut.format ("terribleFibonacci(%2d)=%d\n", 21, terribleFibonacci (21));
	}
	public static long terribleFibonacci (int n) {
		
			 
		if (n <= 1) return n;
		return terribleFibonacci (n - 1) + terribleFibonacci (n - 2);
	}

	/**
	 * PROBLEM 5: The implementation of terribleFibonacci is TERRIBLE! Write a
	 * more efficient version of fibonacci. Do not change runFibonacciLoop or
	 * runFibonacciSomeValues.
	 *
	 * To make fibonacci run faster, you want it so that each call to
	 * fibonacci(n) computes the fibonacci numbers between 0 and n once, not
	 * over and over again.
	 *
	 * Comment: You will want to use a local variable of type "long" rather than
	 * type "int", for the reasons discussed above.
	 *
	 * Comment: At some point, your fibonacci numbers might become negative.
	 * This is normal and expected.
	 * http://en.wikipedia.org/wiki/Integer_overflow We discuss this at length
	 * in our systems classes.
	 *
	 * You may not use any "fields" to solve this problem (a field is a variable
	 * that is declared "outside" of the function declaration --- either before
	 * or after).
	 */
	
	public static void runFibonacciLoop () {
		for (int N = 0; N < 100; N++)
			StdOut.format ("fibonacci(%2d)=%d\n", N, fibonacci (N));
	}
	public static void runFibonacciSomeValues () {
		StdOut.format ("fibonacci(%2d)=%d\n", 13, fibonacci (13));
		StdOut.format ("fibonacci(%2d)=%d\n", 7,  fibonacci (7));
		StdOut.format ("fibonacci(%2d)=%d\n", 21, fibonacci (21));
	}
	public static long fibonacci (int n) {
		if (n <= 1) return n;
		 
		
		  long current =1; long prev=1; int count =1;
		  while(count<n) {
			  long postion;
			  postion= current;
			  current+=prev;
			  prev=postion;
		  
			 
			  count+=1;
		  
		  
		  } return current;
		//return 0; // TODO
	}

	public static void main (String[] args) {
		double[] list0 = new double[] {};
		double[] list1 = new double[] { 5 };
		double[] list2 = new double[] { -3, 5 };
		double[] list3 = new double[] { 2, -3, 5 };
		double[] list4 = new double[] { -1, 2, -3, 5 };
		double[] list5 = new double[] { 0, -1, 2, -3, 5 };

		testSum(0, list0);
		testSum(5, list1);
		testSum(2, list2);
		testSum(4, list3);
		testSum(3, list4);
		testSum(3, list5);

		testReverse(new double[] {}, list0);
		testReverse(new double[] { 5 }, list1);
		testReverse(new double[] { 5, -3 }, list2);
		testReverse(new double[] { 5, -3, 2 }, list3);
		testReverse(new double[] { 5, -3, 2, -1 }, list4);
		testReverse(new double[] { 5, -3, 2, -1, 0 }, list5);

		draw (.5, .5, .25);

		runTerribleSomeValues ();
		runTerribleLoop ();
		runFibonacciSomeValues ();
		runFibonacciLoop();
	}

	public static void testSum (double expected, double[] list) {
		double actual = sum(list);
		if (expected != actual) 
		{
			StdOut.format ("Failed: Expecting [%1.1f] Actual [%1.1f] with argument %s\n", expected, actual, Arrays.toString(list));
		}
		else 
		{
			StdOut.println ("Correct sum: " + actual);
		}
	}

	public static void testReverse (double[] expected, double[] list) {
		reverse(list);
		boolean failed = false;
		
		if ( expected.length != list.length )
		{
			failed = true;
		}
		else 
		{
			int len = list.length;
			for ( int i = 0; i < len; i++ )
			{
				if ( expected[i] != list[i] )
				{
					failed = true;
				}
			}
		}
		
		if ( failed ) 
		{
			StdOut.format ("Failed: Expecting %s Actual %s\n", Arrays.toString(expected), Arrays.toString(list));
		}
		else 
		{
			StdOut.format ("Correct: reverse: %s\n", Arrays.toString(list));
		}
	}
}