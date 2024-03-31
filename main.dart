abstract class Grading {
  String calculateGrade(double marks);
}

class Student {
  String name;
  int id;

  Student(this.name, this.id);

  void displayDetails() {
    print('Name: $name');
    print('ID: $id');
  }
}

class ExamEntry extends Student implements Grading {
  String subject;
  double marksObtained;

  ExamEntry(String name, int id, this.subject, this.marksObtained)
      : super(name, id);

  void displayEntryDetails() {
    super.displayDetails();
    print('Subject: $subject');
    print('Marks Obtained: $marksObtained');
  }

  @override
  String calculateGrade(double marks) {
    if (marks >= 80) {
      return 'A';
    } else if (marks >= 70) {
      return 'B';
    } else if (marks >= 60) {
      return 'C';
    } else if (marks >= 50) {
      return 'D';
    } else if (marks >= 40) {
      return 'E';
    } else {
      return 'F';
    }
  }
}

void main() {
  var examEntry = ExamEntry('John Doe', 12345, 'Math', 85.5);

  examEntry.displayEntryDetails();

  String grade = examEntry.calculateGrade(examEntry.marksObtained);
  print('Grade: $grade');
}
