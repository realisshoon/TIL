package ref;

public class Method1 {
    public static void main(String[] args) {
        Student student1 = new Student();
        initStudent(student1,"학생1",19,90);

        Student student2 = new Student();
        initStudent(student2,"학생2",17,80);

        createStudent(student1);
        createStudent(student2);
    }
    static void initStudent(Student student, String name, int age, int grade){
        student.name = name;
        student.age = age;
        student.grade = grade;

        System.out.println("이름: " + student.name + " 나이: " + student.age + "학점: " + student.grade);
    }
    static void createStudent(Student student){
        System.out.println("이름: " + student.name + " 나이: " + student.age + "학점: " + student.grade);
    }
}
