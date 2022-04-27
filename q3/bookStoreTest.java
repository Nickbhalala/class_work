package q3;
                                              //NIKHIL BHALALA
                                                  //SE-350
import q2.Book;

public class bookStoreTest {
    public static void main(String[] args) {
        Bookstore bookStore = Bookstore.getInstance();
        Bookcase book_case1= new Bookcase("software");
        Bookcase book_case2= new Bookcase("Comedy");
        Bookcase book_case3= new Bookcase("Science Fiction");
        Book b_1 = new Book("0399161880", "TIME IN A BOTTLE", "Howard Falco", " TarcherPerigee", "Novel", 200);
        Book b_2 = new Book("9798788844732", "data science", "Andrew Park", "Independently published", "software", 100);
        Book b_3 = new Book("1947480847", "Writing and perfroming Stand-up Comedy", "Judy carter", "Indie book International", "Comedy", 30);
        Book b_4 = new Book("9781633693425", "The Mind of the Leader", "Rasmus Hougaard", "Harvard Business Review Press", "Science Fiction", 15);
        Book b_5 = new Book("9781585427987", "I AM", "Howard Falco", "TarcherPerigee; First Edition. First Printing. ", "Documentary", 10);
        book_case1.addBook(b_2);
        book_case2.addBook(b_3);
        book_case3.addBook(b_4);
        bookStore.addBookCase(book_case1);
        bookStore.addBookCase(book_case2);
        bookStore.addBookCase(book_case3);

         //System.out.println(Bookstore.getInstance().toString());\
        /*for(Bookcase b: Bookstore.bookstore) {
            System.out.println(" ");
            System.out.println("The bookcase genre is: " + b.getLiterary_genre());
            System.out.println("This is the book and it's information in that bookcase");
            System.out.println(b.getList_book().);
        }*/
        System.out.println();
        for (Bookcase b : Bookstore.bookstore){
            System.out.println("The bookcase genre is: " + b.getLiterary_genre());
            for (Book v: b.getList_book()){
                System.out.println(v.getTitle()+" , "+ v.getAuthor()+" ,"+v.getISBN()+ " ,"+v.getPublisher()+ ", "+ v.getBook_price());
            }
        }

        //bookStore.getBookstore().indexOf(bookStore.toString())
        /*for (Bookcase b : bookStore.getBookstore()){
             if( b.getLiterary_genre().equals(book_case1.literary_genre)){
             System.out.println(b.list_book);
            System.out.println( bookStore.toString());
        }
            if( b.getLiterary_genre().equals(book_case2.literary_genre)){
                System.out.println(b.list_book);
                System.out.println( bookStore.toString());

            }
            if( b.getLiterary_genre().equals(book_case3.literary_genre)){
                System.out.println(b.list_book);
                System.out.println( bookStore.toString());

            }*/




        //boolean add = n.getCase_of_genre().add(bi.addBook(b_1)(bi.addBook(b_2 ));

        /*n.setCase_of_genre(bi.addBook(b_4 ));
        n.setCase_of_genre(bi.addBook(b_1 ));
       // bi.addBook(b_3 );
       // bi.addBook(b_4 );
        //bi.addBook(b_5 );
        System.out.println(n.);*/







    }}

