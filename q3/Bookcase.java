package q3;
import  q2.Book;
//NIKHIL BHALALA
//SE-350
import java.util.ArrayList;

public class Bookcase {
    public   ArrayList<Book> list_book = new ArrayList<>();
    String  literary_genre;

    public Bookcase(String literary_genre) {
        this.literary_genre = literary_genre;
    }
      /* public Bookcase(ArrayList<Book> list_book) {
        this.setList_book( list_book);
    }*/

    public ArrayList<Book> getList_book() {
        return list_book;
    }

    public void setList_book(ArrayList<Book> list_book) {
        this.list_book = list_book;
    }

    public String getLiterary_genre() {
        return literary_genre;
    }

    public void setLiterary_genre(String literary_genre) {
        this.literary_genre = literary_genre;
    }

    public void addBook(Book book) {

         for (String t: Book.LITERARY_GENRE){
             if (t.compareTo(literary_genre)==0){

                 list_book.add(book);
                 return;

             }


             }

             System.out.println("Book belong to different genre");


         return;
     }



   /* public static void main(String[] args) {
        Book b_1 = new Book("111", "yyyy", "vvvv", "gggg", "H", 1000);
        Book b_2 = new Book("9798788844732", "data science", "Andrew Park", "Independently published", "software", 1000);
        Book b_3 = new Book("111", "yyyy", "vvvv", "gggg", "Comedy", 1000);
        Book b_4 = new Book("9798788844732", "data science", "Andrew Park", "Independently published", "Science Fiction", 1000);
        Bookcase b = new Bookcase("software");
        b.addBook(b_2);
        b.addBook(b_1);
        b.addBook(b_3);
        b.addBook(b_4);
        for (Book i : b.list_book) {
            System.out.println(i);
        }
    }
*/
    }







