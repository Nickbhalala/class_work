package question_7;
//Nikhil Bhalala
//se-350
//exercise-2
public class Rectangle8 {
    int length;
    int  height;

    public Rectangle8(int length,int height){
        this.length=length;
        this.height=height;
    }
    public int Perimeter(){

        return  (2*length)+(2*height);
    }
    public  int area(){
        return length*height;
    }


    public  void printDetails(){
        System.out.println(" Length of rectangele is : "+ length);
        System.out.println("Height of rectangele is :" + height );
        System.out.println(" A Perimeter of  Rectangle is: " + Perimeter());
        System.out.println(" A area of Rectangle is : " + area());
    }

}
