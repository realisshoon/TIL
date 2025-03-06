package oop1.ex;

public class RectangleOopMain {
    public static void main(String[] args) {
        Rectangle rectangle = new Rectangle();

        rectangle.height = 5;
        rectangle.width = 3;

        int area = rectangle.calculateArea();
        System.out.println("넓이 : "+ area);

        int perimeter = rectangle.calculatePerimeter();
        System.out.println("둘레 길이 : "+ perimeter);

        boolean square = rectangle.isSquare();
        System.out.println("정사각형인가요? : "+ square);
    }
}
