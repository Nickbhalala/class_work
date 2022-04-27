package com.company;

public class Queue {
    private  int maxSize;
    private  int[]Array;
    private int rear ;
    private int front ;
    public Queue (int size){
        this.maxSize=size;
        this.Array= new int[maxSize];
        this.front=-1;
        this.rear=-1;

    }
    public void enqueue(int data){
        if(rear==-1 && front==-1){
            front=rear=0;
            Array[rear]=data;

        }
        else if (rear==maxSize-1){
            System.out.println("queue is full");
        }
        else {
            rear++;
            Array[rear]=data;
        }
    }
    public int dqueue(){
        if(rear==-1 &&front==-1){
            System.out.println("oueue is empty");
            return -1;
        }
        else if(front==rear) {
            return rear=front=-1;


        }
        else {
            int old_data= Array[front];
            front++;
            return old_data;

        }
    }
    public  void peek(){
        if(rear==-1&& front==-1){
            System.out.println("oueue is empty");
        }
        else {
            int p= Array[front];
            System.out.println(p);
        }
    }
    public  void display(){
        if(rear==-1&&front==-1){
            System.out.println("queue is empty");
        }
        else{
            int tmp =front;
            while (tmp<rear+1){
                tmp= Array[tmp];
                System.out.println(tmp);

            }


        }
    }

}
