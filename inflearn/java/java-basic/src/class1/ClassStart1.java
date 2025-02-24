package class1;

public class ClassStart1 {
    public static void main(String[] args){
        Student[] students = new Student[2];
        
        Student student1 = new Student();
        student1.name = "철수";
        student1.age = 20;
        student1.grade = 90;
        
        Student student2 = new Student();
        student2.name = "영희"; 
        student2.age = 19;
        student2.grade = 100;
        
        students[0] = student1;
        students[1] = student2;
        
        for(int i=0; i<students.length; i++) {
            System.out.println("이름 : " + students[i].name + " 나이 : " + students[i].age + " 성적 : " + students[i].grade);
        }
    }
}
