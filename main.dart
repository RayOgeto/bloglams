class Student {
  String name;
  int id;

  Student(this.name, this.id);

  void displayDetails() {
    print('Name: $name');
    print('ID: $id');
  }
}

class ExamEntry extends Student {
  String subject;
  double marksObtained;

  ExamEntry(String name, int id, this.subject, this.marksObtained)
      : super(name, id);

  void displayEntryDetails() {
    super.displayDetails();
    print('Subject: $subject');
    print('Marks Obtained: $marksObtained');
  }

  String calculateGrade() {
    if (marksObtained >= 80) {
      return 'A';
    } else if (marksObtained >= 70) {
      return 'B';
    } else if (marksObtained >= 60) {
      return 'C';
    } else if (marksObtained >= 50) {
      return 'D';
    } else if (marksObtained >= 40) {
      return 'E';
    } else {
      return 'F';
    }
  }
}

void main() {
  var examEntry = ExamEntry('John Doe', 12345, 'Math', 85.5);

  examEntry.displayEntryDetails();

  String grade = examEntry.calculateGrade();
  print('Grade: $grade');
}
