package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here
        queueLinkList myqueue =new queueLinkList();
        myqueue.enqueue(1);
        myqueue.enqueue(2);
        myqueue.enqueue(3);
        myqueue.enqueue(4);
        myqueue.enqueue(5);
        myqueue.dqueue();
        myqueue.peek();
        //myqueue.display();

    }
}
