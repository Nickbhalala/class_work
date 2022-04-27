package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here
        StackLinkList mystack= new StackLinkList();
        mystack.push(1);
        mystack.push(2);
        mystack.push(3);
        mystack.push(4);
        mystack.push(5);
        mystack.push(6);
        mystack.push(7);
        //mystack.display();
        mystack.pop();
        mystack.pop();
        //mystack.peek();
        mystack.display();
    }
}
