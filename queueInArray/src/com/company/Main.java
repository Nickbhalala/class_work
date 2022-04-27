package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here
        Queue myqueue =new Queue(7);
        myqueue.enqueue(1);
        myqueue.enqueue(2);
        myqueue.enqueue(3);
        myqueue.enqueue(4);
        myqueue.enqueue(5);
        myqueue.enqueue(6);

        myqueue.enqueue(7);myqueue.enqueue(8);


        myqueue.dqueue();
        //myqueue.dqueue();
        //myqueue.dqueue();
       // myqueue.peek();

        myqueue.display();

    }
}
