package com.company;

public class singlylinklist {
    public Node head;
    public Node tmp;
    public  void intsFrist(int data){

        Node NewNode= new Node();
        NewNode.data=data;

        if(head==null){
            head=tmp=NewNode;
        }
        else {
            tmp.next=NewNode;
            tmp= NewNode;

        }



    }
    public void intsfromend(int data){
        Node NewNode=new Node();
        NewNode.data=data;
        if(head==null){
            System.out.println("list is empty");
        }
        else {
            Node current=head;
            while (current.next!=null){
                current=current.next;
            }
            current.next=NewNode;
            current=NewNode;
        }

    }
    public  Node deleteFirst(){
        if(head==null){
            return null ;

        }
        else {
            Node current=head;
            head=current.next;
            return current;

        }



    }
    public Node deleteFromEnd(){
        if(head==null){
            return null;
        }
        else {
            Node current=head;
            Node prev =head;
            while (current.next!=null){
                prev=current;
                current= current.next;
            }
            prev.next=null;
            return prev;




        }
    }
    public Node deleteFormNPos(int n){
        if(head==null){
            return null;

        }
        else {
            Node current =head;
            Node NextNode;
            int pos=0;
            while (pos<n-1){
                current=current.next;
                pos++;
            }
            NextNode=current.next;
            current.next=NextNode.next;
            return NextNode;


        }
    }
    public void reverse(){
        if(head==null){
            System.out.println("list is empty");
        }
        Node current=head;
        Node NextNode= head;
        Node prevNode =null;
        while (NextNode!=null){
            NextNode=NextNode.next;
            current.next=prevNode;
             prevNode=current;
             current=NextNode;

        }
        head =prevNode;
    }
    public void displaylist(){
        if(head==null){
            System.out.println("list is empty");
        }
        else {
            Node current=head;
            while (current!=null){
                System.out.print(current.data);
                current= current.next;
            }
        }
    }
    public  Node getlast(){
        if(head== null){
            return null;

        }
        else{
            Node current= head;
            while (current!=null){
                //System.out.println(current.data);
                current=current.next;



            }
            return current;
        }
    }





}
