package ref;

public class MethodChange2 {
    public static void main(String[] args) {
        Data dataA = new Data();
        dataA.value = 10;

        System.out.println("dataA.value = " + dataA.value); // 10
        changePrimitive(dataA);
        System.out.println("dataA.value = " + dataA.value); // 20

    }
    public static void changePrimitive(Data dataX){ //dataX = dataA
        dataX.value = 20 ;
    }
}

