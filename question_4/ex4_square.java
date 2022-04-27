package question_4;
//Nikhil Bhalala
//se-350
//exercise-2
public class ex4_square {
    int side;
    static final int   SIDES_NUMBER =10;

    public ex4_square   (int side) {
        this.side = side;
    }
    public int Perimeter(){

        return  side+side+side+side;
    }
    public  int area(){
        return side*side;
    }


    public static void main(String[] args) {
        // exercise-2
        // this is output for excises 1
        ex4_square  test1 = new ex4_square (ex4_square .SIDES_NUMBER);
        int x = test1.area();
        int y = test1.Perimeter();
        System.out.println(" this is output for excises 1");
        System.out.println( " A Perimeter of Square is: "+ y);
        System.out.println(" A area of square is : "+ x);
        System.out.println();
    }}
