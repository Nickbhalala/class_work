package q2;
//NIKHIL BHALALA
//SE-350
import java.util.ArrayList;
public class booktests {
   public static ArrayList<Book>  list_book = new ArrayList<Book>();
    public static void main(String[] args)
    {
        Book b_1 = new Book("0399161880", "TIME IN A BOTTLE", "Howard Falco", " TarcherPerigee", "Novel", 200);
        Book b_2 = new Book("9798788844732", "data science", "Andrew Park", "Independently published", "software", 100);
        Book b_3 = new Book("1947480847", "Writing and perfroming Stand-up Comedy", "Judy carter", "Indie book International", "Comedy", 30);
        Book b_4 = new Book("9781633693425", "The Mind of the Leader", "Rasmus Hougaard", "Harvard Business Review Press", "Science Fiction", 15);
        Book b_5 = new Book("9781585427987", "I AM", "Howard Falco", "TarcherPerigee; First Edition. First Printing. ", "Documentary", 10);
         for (Book book : list_book) {
             System.out.println(book);

    }

       /* System.out.println(b_1);
        System.out.println(b_2);
        System.out.println(b_3);
        System.out.println(b_4);
        System.out.println(b_5);*/
        }}


       // System.out.println("Your genre is not in the possible list.");



























