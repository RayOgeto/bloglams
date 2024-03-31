import 'dart:io';

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

  @override
  void displayDetails() {
    print('Exam Entry Details:');
    displayEntryDetails();
  }
}

List<ExamEntry> initializeFromDataFile(String filePath) {
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();

  List<ExamEntry> entries = [];

  for (var line in lines) {
    List<String> data = line.split(',');
    String name = data[0];
    int id = int.parse(data[1]);
    String subject = data[2];
    double marksObtained = double.parse(data[3]);

    entries.add(ExamEntry(name, id, subject, marksObtained));
  }

  return entries;
}

void main() {
  // Path to data file
  String filePath = 'data.txt';

  // Initialize ExamEntry instances from data file
  var examEntries = initializeFromDataFile(filePath);

  // Display exam entry details for each student
  for (var entry in examEntries) {
    entry.displayDetails();
    String grade = entry.calculateGrade(entry.marksObtained);
    print('Grade: $grade');
    print('-------------------------');
  }
}
