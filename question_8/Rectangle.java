package question_8;
//Nikhil Bhalala
//se-350
//exercise-2
public class Rectangle {
    int length;
    int  height;

    public int getHeight() {
        return height;
    }

    public int getLength() {
        return length;
    }

    public Rectangle(int length, int height){
        this.length=length;
        this.height=height;
    }
    public int Perimeter(){

        return  (2*getLength())+(2*getHeight());
    }
    public  int area(){
        return getLength()*getHeight();
    }
    public void getDetails(){
        System.out.println(" Length of rectangele is : "+ getLength());
        System.out.println("Height of rectangele is :" + getHeight() );
        System.out.println(" A Perimeter of  Rectangle is: " + Perimeter());
        System.out.println(" A area of Rectangle is : " + area());
    }
    public  void printDetails(){
        System.out.println("rectangele");
        getDetails();

    }


}
