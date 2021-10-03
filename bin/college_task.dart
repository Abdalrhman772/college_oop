void main() {
  Students s1 = Students();
  s1.addStudent(
      email: 'student@gmail.com',
      phone: 123456789,
      name: 'ali',
      age: 22,
      address: 'Alexandria',
      id: 'A15');

  s1.addSubject('A15', 'math', 90);
  s1.addSubject('A15', 'arabic', 85);
  s1.addSubject('A15', 'english', 40);
  s1.printStudentData('A15');
  s1.calculateStudentGrade('A15');

  s1.addStudent(
      email: 'student22@gmail.com',
      phone: 12345678999,
      name: 'Ahmed',
      age: 19,
      address: 'Cairo',
      id: 'B16');

  s1.addSubject('B16', 'math', 40);
  s1.addSubject('B16', 'arabic', 90);
  s1.addSubject('B16', 'english', 45);
  s1.removeStudent('A15');
  s1.printStudentData();
  s1.calculateStudentGrade('B16');
}

class Person {
  String name, address;
  int age;
  String id;

  Person(
      {required this.name,
      required this.address,
      required this.age,
      required this.id});
}

class Student extends Person {
  String email;
  int phone;
  Map<String, double> subjects = {};

  Student(
      {required this.email,
      required this.phone,
      required String name,
      required String add,
      required int age,
      required String id})
      : super(name: name, address: add, age: age, id: id);

  void addSubject(String subName, double grade) {
    subjects.addAll({subName: grade});
  }

  void studentData() {
    print('Student Details :');
    print('student name: $name');
    print('age: $age');
    print('id: $id');
    print('address: $address');
    print('email: $email');
    print('phone: $phone');
    print('-----------------');
    print('Student Grades :');
    subjects.forEach((key, value) {
      print('$key = $value');
    });
  }
}

class Students {
  List<Student> stud = [];
  void addStudent(
      {required String name,
      required String address,
      required int age,
      required String id,
      required int phone,
      required String email}) {
    stud.add(Student(
        name: name,
        add: address,
        age: age,
        id: id,
        email: email,
        phone: phone));
  }

  void removeStudent(String studentId) {
    stud.removeWhere((element) => element.id == studentId);
  }

  void printStudentData([String? i]) {
    if (i != null) {
      var res = stud.firstWhere((element) => element.id == i);
      res.studentData();
    } else {
      for (var item in stud) {
        item.studentData();
      }
    }
  }

  void addSubject(String i, String subj, double grade) {
    var res = stud.firstWhere((element) => element.id == i);
    res.addSubject(subj, grade);
  }

  void calculateStudentGrade(String id) {
    var res = stud.firstWhere((element) => element.id == id);
    res.subjects.forEach((key, value) {
      if (value >= 50) {
        print('your grade in $key = $value, Passed!');
      } else if (value < 50) {
        print('your grade in $key = $value, Failed');
      }
    });
  }
}
