package com.company;

public class BST_tree {
    private  Node root;
    public void put(int value){
        if(root==null){
            root= new Node(value);
        }else {
            root.put(value);
        }

    }

}
