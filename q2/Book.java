package q2;
//NIKHIL BHALALA
//SE-350
public class Book {
  private String ISBN;
  private  String title;
  private String Author;
  private String publisher;
  public    String  literary_genre;
  private  int book_price;
    public static final String[] LITERARY_GENRE = {"software", "Horror", "Science Fiction", "Comedy", "Documentary", "Autobiography"
                                                                            };


  public Book(String ISBN, String title, String author, String publisher, String literary_genre, int book_price) {
   /* this.ISBN = ISBN;
    this.title = title;
    this.Author = author;
    this.publisher = publisher;
    this.literary_genre = literary_genre;
    this.book_price = book_price; */
    this.setISBN(ISBN);
    this.setTitle(title);
    this.setAuthor(author);
    this.setPublisher(publisher);
    this.setLiterary_genre(literary_genre);
    this.setBook_price(book_price);
  }

  public String getISBN() {
    return ISBN;
  }

  public void setISBN(String ISBN) {
    this.ISBN = ISBN;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getAuthor() {
    return Author;
  }

  public void setAuthor(String author) {
    Author = author;
  }

  public String getPublisher() {
    return publisher;
  }

  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  public String getLiterary_genre() {
    return literary_genre;
  }

  public void setLiterary_genre(String literary_genre) {
    for (String book : LITERARY_GENRE) {
      if (book.equals(literary_genre)) {
        System.out.println("Your genre is in the LITERARY_GENRE. Check it out: ");
        System.out.println("Book{" +
                "ISBN=" + ISBN +
                ", title='" + title + '\'' +
                ", Author='" + Author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", literary_genre='" + literary_genre + '\'' +
                ", book_price=" + book_price +
                '}');
        //this.literary_genre = literary_genre;
        return;
      }

    }
    System.out.println("Not in the LITERARY_GENRE.");
    }

    public int getBook_price() {
        return book_price;
    }

    public void setBook_price(int book_price) {
        this.book_price = book_price;
    }

    /*@Override
  /public String  toString() {
        return "Book{" +
                "ISBN=" + ISBN +
                ", title='" + title + '\'' +
                ", Author='" + Author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", literary_genre='" + literary_genre + '\'' +
                ", book_price=" + book_price +
                '}';
   // }*/
}
