package question_7;
//Nikhil Bhalala
//se-350
//exercise-2
public class Square {
    public int side;

    public Square(int side) {
        this.side = side;
    }

    public int Perimeter(){

        return  side+side+side+side;
    }
    public  int area(){
        return side*side;
    }

    public  void printDetails(){
        System.out.println(" Length of Square is : "+ side);
        System.out.println(" A Perimeter of  Square is: " + Perimeter());
        System.out.println(" A area of   Square is : " + area());
        System.out.println();

    }
}
