// Interface: Role
abstract class Role {
  void displayRole();
}

// Base class: Person
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print("Role: Unknown");
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

// Student class extends Person
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(
      String name,
      int age,
      String address,
      this.studentID,
      this.grade,
      this.courseScores,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    int total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  void displayStudentInfo() {
    print("Student Information:\n");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}");
  }
}

// Teacher class extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name,
      int age,
      String address,
      this.teacherID,
      this.coursesTaught,
      ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    print("\nTeacher Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Student Management System (main method)
void main() {
  // Student: John Doe with average score 89.0 = (90+85+92)/3
  var student = Student(
    'John Doe',
    20,
    '123 Main St',
    'S123',
    'A',
    [90, 85, 92], // 267 / 3 = 89.0
  );

  // Teacher: Mrs. Smith teaches 3 courses
  var teacher = Teacher(
    'Mrs. Smith',
    35,
    '456 Oak St',
    'T456',
    ['Math', 'English', 'Bangla'],
  );

  student.displayStudentInfo();
  teacher.displayTeacherInfo();
}
