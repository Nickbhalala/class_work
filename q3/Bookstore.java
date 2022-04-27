package q3;
//NIKHIL BHALALA
//SE-350
import java.awt.print.Book;
import java.util.ArrayList;

public class Bookstore {
 public static ArrayList<Bookcase> bookstore = new ArrayList<Bookcase>();
 private static Bookstore instance = null;

 public ArrayList<Bookcase> getBookstore() {
  return bookstore;
 }

 public void setBookstore(ArrayList<Bookcase> bookstore) {
  this.bookstore = bookstore;
 }

 public static Bookstore getInstance() {
  if(instance ==null){
   instance = new Bookstore();
  }
  return instance;
 }

 public static void setInstance(Bookstore instance) {
  Bookstore.instance = instance;
 }
 //this will the book case to the arraylist
 void addBookCase(Bookcase book_case){
  boolean t = false;
  for(Bookcase bookcase : bookstore){

   if(bookcase.getLiterary_genre().compareTo(book_case.literary_genre)==0){

    System.out.println(" already present");
    t = true;
    bookcase.list_book.addAll(book_case.list_book);

   }
  }


  if(t==false){
   bookstore.add(book_case);
  }
 }




 /*@Override
 public String toString() {
  return "Bookstore{" +
          "list_book=" + list_book +
          ", literary_genre='" + literary_genre + '\'' +
          '}';
 }*/

 /*public  void  addBookstore(Bookcase case_bo0k) {
 for (Bookcase bookcase : case_of_genre) {
  if (bookcase.getLiterary_genre().compareTo(case_bo0k.getLiterary_genre()) == 0) {
   list_book.addAll(case_bo0k.list_book);
  }

 }*/


}




