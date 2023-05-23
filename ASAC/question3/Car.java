package ASAC.question3;

public class Car {
        private String carName;
        private String carManufacturingCompany;
        private int carReleaseYear; 
        private int carPrice;
    
        public Car(){
            carName=new String();
            carManufacturingCompany= new String();
            carReleaseYear=0;
            carPrice=0;
        }
        public Car(String carName, String carManufacturingCompany,int carReleaseYear,int carPrice){
            this.carName=carName;
            this.carManufacturingCompany=carManufacturingCompany;
            this.carReleaseYear=carReleaseYear;
            this.carPrice=carPrice;
        }
        public String toString(){
            return carName+", "+carManufacturingCompany+", "
                    +carReleaseYear+", "+carPrice;
        }
}
