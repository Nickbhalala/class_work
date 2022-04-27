package question_2;
//Nikhil Bhalala
//se-350
//exercise-2
import questions_1.ex1_square;

public class ex2_SquareTest {

    public static void main(String[] args) {
        // exercise-2
        // this is output for excises 1
        ex1_square test1 = new ex1_square();
        test1.side = 5;
        int x = test1.area();
        int y = test1.Perimeter();
        System.out.println(" this is output for excises 1");
        System.out.println( " A Perimeter of Square is: "+ y);
        System.out.println(" A area of square is : "+ x);
        System.out.println();
}}
