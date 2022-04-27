package algs11;

import java.util.Arrays;
import stdlib.*;

/**
 * This is a skeleton file for your homework. Edit the sections marked TODO. You
 * may also edit the function "main" to test your code.
 *
 * You must not change the declaration of any method. This will be true of every
 * skeleton file I give you.
 *
 * For example, you will get zero points if you change the line
 * <pre>
 *     public static double minValue (double[] list) {
 * </pre>
 * to something like
 * <pre>
 *     public static void minValue (double[] list) {
 * </pre>
 * or
 * <pre>
 *     public static double minValue (double[] list, int i) {
 * </pre>
 * 
 * Each of the functions below is meant to be SELF CONTAINED. This means that
 * you should use no other functions or classes. You should not use any HashSets
 * or ArrayLists, or anything else! In addition, each of your functions should go
 * through the argument array at most once. The only exception to this
 * removeDuplicates, which is allowed to call numUnique and then go through the
 * array once after that.
 */
public class hw1 {

	private static int i;

	/**
	 * minValue returns the minimum value in an array of doubles. You can assume
	 * the array is nonempty and has no duplicates. Your solution must go
	 * through the array exactly once. Your solution must not call any other
	 * functions. Here are some examples (using "==" informally):
	 *
	 * <pre>
	 *   -7  == minValue (new double[] { -7 })
	 *    1  == minValue (new double[] { 1, 7, 8, 11 })
	 *   -7  == minValue (new double[] { 1, -4, -7, 7, 8, 11 })
	 *   -13 == minValue (new double[] { -13, -4, -7, 7, 8, 11 })
	 *   -13 == minValue (new double[] { 1, -4, -7, 7, 8, 11, -13 })
	 * </pre>
	 */
	public static double minValue (double[] list) {
		
		double min= Double.MAX_VALUE;
		for(int i=0;i<list.length;i++) {
			if(min>list[i]) {
				min=list[i];
		}
		}
		return min;
		//return StdRandom.uniform (); //TODO: fix this
	}

	/**
	 * minPosition returns the position of the minimum value in an array of
	 * doubles. The first position in an array is 0 and the last is the
	 * array.length-1.
	 *
	 * You can assume the array is nonempty and has no duplicates. Your solution
	 * must go through the array exactly once. Your solution must not call any
	 * other functions. Here are some examples (using "==" informally):
	 *
	 * <pre>
	 *   0 == minPosition(new double[] { -7 })
	 *   2 == minPosition(new double[] { 1, -4, -7, 7, 8, 11 })
	 *   0 == minPosition(new double[] { -13, -4, -7, 7, 8, 11 })
	 *   6 == minPosition(new double[] { 1, -4, -7, 7, 8, 11, -9 })
	 * </pre>
	 */
	public static int minPosition (double[] list) {
		int count=0;
		double min=Double.MAX_VALUE;
		for(int i=0 ;i<list.length;i++) {
			if(min>list[i]) {
				min= list[i];
				count=i;
				
				
			}
		}
		return count;
		//return StdRandom.uniform (100); //TODO: fix this
	}

	/**
	 * distanceBetweenMinAndMax returns difference between the minPosition and
	 * the maxPosition in an array of doubles.
	 *
	 * You can assume the array is nonempty and has no duplicates. Your solution
	 * must go through the array exactly once. Your solution must not call any
	 * other functions. Here are some examples (using "==" informally):
	 *
	 * <pre>
	 *   0 == distanceBetweenMinAndMax(new double[] { -7 })                      // -7,-7 are the min and max
	 *   3 == distanceBetweenMinAndMax(new double[] { 1, -4, -7, 7, 8, 11 }),    // -7,11
	 *   5 == distanceBetweenMinAndMax(new double[] { -13, -4, -7, 7, 8, 11 })   // -13,11
	 *   1 == distanceBetweenMinAndMax(new double[] { 1, -4, -7, 7, 8, 11, -9 }) // -9,11
	 * </pre>
	 */
	public static int distanceBetweenMinAndMax (double[] list) {
		int count=0;
		double Max=Double.MIN_VALUE;
		for(int i=0 ;i<list.length;i++) {
			if(Max< list[i]) {
				Max= list[i];
				count=i;
			
				
				
			}
		}
			if(count<minPosition ( list)) {
				return   minPosition ( list)-count ;
				
		}
		return   count-minPosition ( list) ;
		
		
		
		
		
		
		//return StdRandom.uniform (100); //TODO: fix this
	}

	/**
	 * numUnique returns the number of unique values in an array of doubles.
	 * Unlike the previous questions, the array may be empty and it may contain
	 * duplicate values. Also unlike the previous questions, you can assume the
	 * array is sorted.
	 *
	 * Your solution must go through the array exactly once. Your solution must
	 * not call any other functions. Here are some examples (using "=="
	 * informally):
	 *
	 * <pre>
	 *     0 == numUnique(new double[] { })
	 *     1 == numUnique(new double[] { 11 })
	 *     1 == numUnique(new double[] { 11, 11, 11, 11 })
	 *     8 == numUnique(new double[] { 11, 11, 11, 11, 22, 33, 44, 44, 44, 44, 44, 55, 55, 66, 77, 88, 88 })
	 *     8 == numUnique(new double[] { 11, 22, 33, 44, 44, 44, 44, 44, 55, 55, 66, 77, 88 })
	 * </pre>
	 */
	public static int numUnique (double[] list) {
		int count=0;
		if(list.length==0) {
			return 0;
		}
		
		for(int i=0 ;i<list.length-1;i++) {
			
			if(list[i]!=list[i+1]) {
				count++;
				
			}
		}return count+1;
		//return StdRandom.uniform (100); //TODO: fix this
	}

	/**
	 * removeDuplicates returns a new array containing the unique values in the
	 * array. There should not be any extra space in the array --- there should
	 * be exactly one space for each unique element (Hint: numUnique tells you
	 * how big the array should be). You may assume that the list is sorted, as
	 * you did for numUnique.
	 *
	 * Your solution may call numUnique, but should not call any other
	 * functions. After the call to numUnique, you must go through the array
	 * exactly one more time. Here are some examples (using "==" informally):
	 *
	 * <pre>
	 *   new double[] { }
	 *     == removeDuplicates(new double[] { })
	 *   new double[] { 11 }
	 *     == removeDuplicates(new double[] { 11 })
	 *     == removeDuplicates(new double[] { 11, 11, 11, 11 })
	 *   new double[] { 11, 22, 33, 44, 55, 66, 77, 88 }
	 *     == removeDuplicates(new double[] { 11, 11, 11, 11, 22, 33, 44, 44, 44, 44, 44, 55, 55, 66, 77, 88, 88 })
	 *     == removeDuplicates(new double[] { 11, 22, 33, 44, 44, 44, 44, 44, 55, 55, 66, 77, 88 })
	 * </pre>
	 */
	public static double[] removeDuplicates (double[] list) {
		double[] value=new double[ numUnique(list)];
		int count=0;
		int i;
									
		if(list.length==0) {
			return value;
		}
		
		for( i=0; i<list.length-1;i++) {
			if(list[i]!=list[i+1]) {
											
				value[count]=list[i];
				count++;
		}
			
	
		}
		value[count]=list[i];
		return value;
		
		
		
		
		
		
		
		
		
		
		//return null; // TODO: fix this
	}

	/**
	 * A test program, using private helper functions.  See below.
	 * To make typing tests a little easier, I've written a function to convert strings to arrays.  See below.
	 */
	public static void main (String[] args) {
		// for minValue: array must be nonempty with unique elements
		testMinValue (11, "11");
		testMinValue (-11, "-11");
		testMinValue (9, "9 11 21 31 41");
		testMinValue (9, "11 9 21 31 41");
		testMinValue (9, "11 21 9 31 41");
		testMinValue (9, "11 21 31 9 41");
		testMinValue (9, "11 21 31 41 9");
		testMinValue (-99, "-99 -11 -21 -31 -41");
		testMinValue (-99, "-11 -99 -21 -31 -41");
		testMinValue (-99, "-11 -21 -99 -31 -41");
		testMinValue (-99, "-11 -21 -31 -99 -41");
		testMinValue (-99, "-11 -21 -31 -41 -99");
		testMinValue (-7, "1 -4 -7 7 8 11 9 -5");		
		testMinValue (-0.5, "0.2 -0.5 -0.1");

		// for minPosition: array must be nonempty with unique elements
		testMinPosition (0, "11");
		testMinPosition (0, "-11");
		testMinPosition (0, "9 11 21 31 41");
		testMinPosition (1, "11 9 21 31 41");
		testMinPosition (2, "11 21 9 31 41");
		testMinPosition (3, "11 21 31 9 41");
		testMinPosition (4, "11 21 31 41 9");
		testMinPosition (0, "-99 -11 -21 -31 -41");
		testMinPosition (1, "-11 -99 -21 -31 -41");
		testMinPosition (2, "-11 -21 -99 -31 -41");
		testMinPosition (3, "-11 -21 -31 -99 -41");
		testMinPosition (4, "-11 -21 -31 -41 -99");
		testMinPosition (2, "1 -4 -7 7 8 11 9 -5");
		testMinPosition (1, "0.2 -0.5 -0.1");
		
		// for distanceBetweenMinAndMax: array must be nonempty with unique elements
		testDistanceBetweenMinAndMax (0, "11");
		testDistanceBetweenMinAndMax (0, "-11");
		testDistanceBetweenMinAndMax (4, "9 11 21 31 41");
		testDistanceBetweenMinAndMax (3, "11 9 21 31 41");
		testDistanceBetweenMinAndMax (2, "11 21 9 31 41");
		testDistanceBetweenMinAndMax (1, "11 21 31 9 41");
		testDistanceBetweenMinAndMax (1, "11 21 31 41 9");
		testDistanceBetweenMinAndMax (4, "9 -11 -21 -31 -41");
		testDistanceBetweenMinAndMax (3, "-11 9 -21 -31 -41");
		testDistanceBetweenMinAndMax (2, "-11 -21 9 -31 -41");
		testDistanceBetweenMinAndMax (1, "-11 -21 -31 9 -41");
		testDistanceBetweenMinAndMax (1, "-11 -21 -31 -41 9");
		testDistanceBetweenMinAndMax (3, "1 -4 -7 7 8 11 9 -5");
		testDistanceBetweenMinAndMax (3, "0.1 -0.4 -0.7 0.7 0.8 1.1 0.9 -0.5");

		// for numUnique: array must be sorted
		testNumUnique (0, "");
		testNumUnique (1, "11");
		testNumUnique (1, "11 11 11 11");
		testNumUnique (4, "11 21 31 41");
		testNumUnique (4, "11 11 11 21 31 31 31 31 41");
		testNumUnique (4, "11 21 21 21 31 41 41 41 41");
		testNumUnique (4, "11 11 21 21 21 31 31 41 41 41 41");
		testNumUnique (8, "11 11 11 11 21 31 41 41 41 41 41 51 51 61 71 81 81");
		testNumUnique (8, "11 21 31 41 41 41 41 41 51 51 61 71 81");
		testNumUnique (7, "11 11 11 11 21 31 41 41 41 41 41 51 51 61 71");
		testNumUnique (7, "11 21 31 41 41 41 41 41 51 51 61 71");
		testNumUnique (8, "-81 -81 -81 -81 -71 -61 -51 -51 -51 -51 -41 -41 -31 -21 -11 -11 -11");
		
		// for removeDuplicates: array must be sorted
		testRemoveDuplicates ("", "");
		testRemoveDuplicates ("11", "11");
		testRemoveDuplicates ("11", "11 11 11 11");
		testRemoveDuplicates ("11 21 31 41", "11 21 31 41");
		testRemoveDuplicates ("11 21 31 41", "11 11 11 21 31 31 31 31 41");
		testRemoveDuplicates ("11 21 31 41", "11 21 21 21 31 41 41 41 41");
		testRemoveDuplicates ("11 21 31 41", "11 11 21 21 21 31 31 41 41 41 41");
		testRemoveDuplicates ("11 21 31 41 51 61 71 81", "11 11 11 11 21 31 41 41 41 41 41 51 51 61 71 81 81");
		testRemoveDuplicates ("11 21 31 41 51 61 71 81", "11 21 31 41 41 41 41 41 51 51 61 71 81");
		testRemoveDuplicates ("11 21 31 41 51 61 71", "11 11 11 11 21 31 41 41 41 41 41 51 51 61 71");
		testRemoveDuplicates ("11 21 31 41 51 61 71", "11 21 31 41 41 41 41 41 51 51 61 71");
		testRemoveDuplicates ("-81 -71 -61 -51 -41 -31 -21 -11", "-81 -81 -81 -81 -71 -61 -51 -51 -51 -51 -41 -41 -31 -21 -11 -11 -11");
		
		StdOut.println ("Finished tests");
	}
	
	/* Test functions --- lot's of similar code! */
	private static void testMinValue (double expected, String list) {
		double[] aList = doublesFromString (list);
		double actual = minValue (aList);
		if (! Arrays.equals (aList, doublesFromString (list))) {
			StdOut.format ("Failed minValue([%s]): Array modified\n", list);
		}
		if (expected != actual) {
			StdOut.format ("Failed minValue([%s]): Expecting (%.1f) Actual (%.1f)\n", list, expected, actual);
		}
	}
	private static void testMinPosition (int expected, String list) {
		double[] aList = doublesFromString (list);
		int actual = minPosition (aList);
		if (! Arrays.equals (aList, doublesFromString (list))) {
			StdOut.format ("Failed minPosition([%s]): Array modified\n", list);
		}
		if (expected != actual) {
			StdOut.format ("Failed minPosition([%s]): Expecting (%d) Actual (%d)\n", list, expected, actual);
		}
	}
	private static void testDistanceBetweenMinAndMax (int expected, String list) {
		double[] aList = doublesFromString (list);
		int actual = distanceBetweenMinAndMax (aList);
		if (! Arrays.equals (aList, doublesFromString (list))) {
			StdOut.format ("Failed distanceBetweenMinAndMax([%s]): Array modified\n", list);
		}
		if (expected != actual) {
			StdOut.format ("Failed distanceBetweenMinAndMax([%s]): Expecting (%d) Actual (%d)\n", list, expected, actual);
		}
	}	

	private static void testNumUnique (int expected, String list) {
		double[] aList = doublesFromString (list);
		int actual = numUnique (aList);
		if (! Arrays.equals (aList, doublesFromString (list))) {
			StdOut.format ("Failed numUnique([%s]): Array modified\n", list);
		}
		if (expected != actual) {
			StdOut.format ("Failed numUnique([%s]): Expecting (%d) Actual (%d)\n", list, expected, actual);
		}
	}

	private static void testRemoveDuplicates (String expected, String list) {
		double[] aList = doublesFromString (list);
		double[] actual = removeDuplicates (aList);
		if (! Arrays.equals (aList, doublesFromString (list))) {
			StdOut.format ("Failed removeDuplicates([%s]): Array modified\n", list);
		}
		double[] aExpected = doublesFromString (expected);
		// != does not do what we want on arrays
		if (! Arrays.equals (aExpected, actual)) {
			StdOut.format ("Failed removeDuplicates([%s]): Expecting (%s) Actual (%s)\n", list, Arrays.toString (aExpected), Arrays.toString (actual));
		}
	}
	    
	/* A utility function to create an array of doubles from a string. */
	// The string should include a list of numbers, separated by single spaces.
	private static double[] doublesFromString (String s) {
		if ("".equals (s)) return new double [0]; // empty array is a special case
		String[] nums = s.split (" ");
		double[] result = new double[nums.length];
		for (int i = nums.length-1; i >= 0; i--) {
			try { 
				result[i] = Double.parseDouble (nums[i]); 
			} catch (NumberFormatException e) { 
				throw new IllegalArgumentException (String.format ("Bad argument \"%s\": could not parse \"%s\" as a double", s, nums[i]));
			}
		}
		return result;
	}
}