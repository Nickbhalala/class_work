package question_8;
//Nikhil Bhalala
//se-350
//exercise-2
public class Square {
    int side;

    public int getSide() {
        return side;
    }
    public Square(int side) {
        this.side = side;
    }

    public int Perimeter(){

        return  getSide()*4;
    }
    public  int area(){
        return getSide()*getSide();
    }
    public void getDetails(){
        System.out.println(" Length of Square is : "+ getSide());
        System.out.println(" A Perimeter of  Square is: " + Perimeter());
        System.out.println(" A area of   Square is : " + area());
    }
    public  void printDetails(){
        System.out.println("Square");
        getDetails();
        System.out.println("  ");


    }
}
