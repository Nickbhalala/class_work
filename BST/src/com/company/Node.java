package com.company;

public class Node {
    Node leftchild;
    Node rigthchild;
    int data;
    public Node(int data){
        this.data= data;
    }
    public void put (int value){
        if(value==data){
            return;

        }
        if(value<data){
            if(leftchild==null){
                leftchild=new Node(value);

            }
            leftchild.put(value);

        }
        if(value>data){
            if(rigthchild==null){
                rigthchild= new Node(value);

            }rigthchild.put(value);
        }
    }
    public  Node getVaule(int value){
        if(value==data){
            return this;

        }
        if(value<data){
            if(leftchild!=null){
                return  leftchild.getVaule(value);

            }

        }else {
            if(rigthchild!=null){
                rigthchild.getVaule(value);
            }
        }
        return null;


    }
    public int min(){
        if(leftchild==null){
            return data;
        }
        return leftchild.min();
    }
    public int max(){
         if(rigthchild==null){
             return  data;
         }
         return rigthchild.max();
    }


    public Node getLeftchild() {
        return leftchild;
    }

    public void setLeftchild(Node leftchild) {
        this.leftchild = leftchild;
    }

    public Node getRigthchild() {
        return rigthchild;
    }

    public void setRigthchild(Node rigthchild) {
        this.rigthchild = rigthchild;
    }

    public int getData() {
        return data;
    }

    public void setData(int data) {
        this.data = data;
    }
}
