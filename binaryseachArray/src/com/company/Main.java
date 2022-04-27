package com.company;

public class Main {

    public static void main(String[] args) {
        int[]a1= {1,2,12,13,23,24,34,35,45,46,80};
        System.out.println(binarySeacher(a1,a1.length-1,14));

	// write your code here
    }
    public static int binarySeacher(int[]a, int n, int data ){
        int l=0;
        int r =n-1;
        while (l<r){
            int midpoint= (l+r)/2;
            if(data==a[midpoint]){
                return midpoint;

            }
            else if (data<a[midpoint]){
                r= midpoint-1;
            }
            else {
                l= midpoint+1;

            }
        }return -1;
    }
}
