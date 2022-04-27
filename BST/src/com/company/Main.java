package com.company;

public class Main {

    public static void main(String[] args) {
	Node st= new Node(1);
	BST_tree i =new BST_tree();
	st.put(4);
	st.put(10);
        st.put(5);
        st.put(20);
        st.put(15);
        st.put(14);
        st.put(7);


        int f=st.max();
        System.out.println(f);
        System.out.println(st.getVaule(10));

    }
}
