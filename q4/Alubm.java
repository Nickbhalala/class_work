package q4;
//NIKHIL BHALALA
//SE-350
import q2.Book;
import  q2.booktests;
public class Alubm extends Book {
    private int ISMN;


    public Alubm( String ISBN, String title, String author, String publisher, String literary_genre, int book_price,int iSMN) {
        super(ISBN, title, author,  publisher,  literary_genre,  book_price);
        //super(literary_genre, iSBN);
        ISMN = iSMN;
    }

    public int getISMN() {
        return ISMN;
    }

    public void setISMN(int ISMN) {
        this.ISMN = ISMN;
    }

    @Override
    public String toString() {
        return "Alubm{" + super.toString()+ "ISMN=" + ISMN +
                '}';
    }
}