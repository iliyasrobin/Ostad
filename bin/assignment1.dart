abstract class Role{
  void displayRole();
}

class Person implements Role{
  String _name;
  int _age;
  String _address;


  get getName => _name;
  get getAge => _age;
  get getAddress => _address;

  Person(this._name, this._age, this._address);

  @override
  void displayRole() {
    print("Role: Person");
  }

}

class Student extends Person{
  //String studentID;
  //String grade;
  List<double> courseScores;
  String name;
  int age;
  String address;

  Student(this.name, this.age, this.address, this.courseScores ):super(name, age, address);


  double avgScore(){
    double sum = 0;
    for(double i in courseScores){
      sum= sum+i;
    }
    return sum / courseScores.length;
  }

  @override
  void displayRole() {
    print("Role: Student");
  }

}


class Teacher extends Person{

  List<String> courseTaught;
  String name;
  int age;
  String address;
  Teacher(this.name, this.age, this.address, this.courseTaught ):super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

}

class StudentManagementSystem{

}


main(){
  Student stu = Student("Jhon Doe", 20, "123 Main St", [90,85,82]);
  print("Student Information");
  stu.displayRole();
  print("Name: ${stu.name}");
  print("Age: ${stu.age}");
  print("Address: ${stu.address}");
  print("Avarage Score: ${stu.avgScore()}");


  Teacher tea = Teacher("Mr. Smith", 35, "456 Oak St", ["Bangla","English", "Math" ]);
  print("Teacher Information");
  tea.displayRole();
  print("Name: ${tea.name}");
  print("Age: ${tea.age}");
  print("Address: ${tea.address}");
  print("Course Taught:");
  for (var i in tea.courseTaught){
    print('- $i');
  }


//Polymorphism
//   Person jhonDoe = Student("Jhon Doe", 23, "dhaka", [90,85,82]);
//   jhonDoe.displayRole();
//   print(jhonDoe.getName);
//   print(jhonDoe.getAge);
//   print(jhonDoe.getAddress);
//
//
//
//   Person smith = Teacher("Mr. Smith", 35, "456 Oak St", ["Bangla","English", "Math" ]);
//   smith.displayRole();
//   print(smith.getName);
//   print(smith.getAge);
//   print(smith.getAddress);



}