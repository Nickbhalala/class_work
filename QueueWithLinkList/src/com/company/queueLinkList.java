package com.company;

public class queueLinkList {
    private Node rear;
    private Node front;
    public  void enqueue(int data){
        Node NewNode=new Node();
        NewNode.data= data;
        if(front==null&& rear==null){
            rear= front=NewNode;


        }else {
            rear.next= NewNode;
            rear=NewNode;

        }

    }
    public void dqueue(){
        if( front==null&& rear==null){
            System.out.println("list is empty");
        }
        else {
            Node tmp =front;
            System.out.println(tmp.data);
            front =front.next;

        }

    }
    public  void  peek(){
        if(front==null&&rear==null){
            System.out.println("list is empty");
        }
        else {
            System.out.println(front.data);
        }
    }
    public void display(){
        if(front==null&& rear==null){
            System.out.println("list is empty");
        }
        else {
            Node tmp = front;
            while (tmp!=null){
                System.out.println(tmp.data);
                tmp=tmp.next;
            }
        }
    }
}
