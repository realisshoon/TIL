package ref;
/*
* 대원칙을 명심 할 것
* 자바는 항상 변수의 값을 복사해서 대입한다.
* */

public class MethodChange1 {
    public static void main(String[] args) {
        int a = 10;
        System.out.println("a = " + a); // 10
        changePrimitive(a);
        System.out.println("a = " + a); // 20 (X -> 10 )
    }
    public static void changePrimitive(int x){  //int a = x
        x = 20;    // 값만 복사
    }
}
