package question_5;
//Nikhil Bhalala
//se-350
//exercise-2
public class Rectangle {
        int length;
        int height;

        public Rectangle(int length, int height) {
            this.length = length;
            this.height = height;
        }

        public int Perimeter() {

            return (2 * length) + (2 * height);
        }

        public int area() {
            return length * height;
        }

    }






