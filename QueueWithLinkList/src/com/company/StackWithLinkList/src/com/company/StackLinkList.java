package com.company;

public class StackLinkList {

    public Node top;
    public void push(int data){
        Node NewNode= new Node();
        NewNode.data=data;
        NewNode.Next=top;
        top= NewNode;

            ;

    }
    public void pop(){
        if(top==null){
            System.out.println("stak is empty");
        }
        else {
            int old_top = top.data;
            System.out.println(old_top);
            top= top.Next;

        }
    }
    public void peek(){
        if(top==null){
            System.out.println("stack is empty");
        }
        else {
            System.out.println(top.data);

        }
    }
    public  void display(){
        if(top==null){
            System.out.println("stack is empty");
        }
        else {
            Node tmp;
            tmp =top;
            while (tmp!=null){
                System.out.println(tmp.data);
                tmp= tmp.Next;
            }

        }
    }
}
