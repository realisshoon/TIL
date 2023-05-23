package ASAC.question3;
import java.util.ArrayList;
import ASAC.question3.Car;


public class index{
    public static void main(String[] args){
        ArrayList<Car> carList=new ArrayList();

        Car c1=new Car("아반떼 AD","현대",2015,10000000);
        Car c2=new Car("C-Class","Mercedes-Benz",2022,55000);
        Car c3=new Car("911","Porsche",2020,100000);

        carList.add(c1);
        carList.add(c2);
        carList.add(c3);
        for(int i =0;i<3;i++){
            System.out.println();
        }

    }
}