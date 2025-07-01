import 'dart:io';

void main() {
  stdout.write("Enter the student’s score (0-100): ");
  int score = int.parse(stdin.readLineSync()!);

  if (score >= 90 && score <= 100) {
    print("Grade: A");
  } else if (score >= 80 && score <= 89) {
    print("Grade: B");
  } else if (score >= 70 && score <= 79) {
    print("Grade: C");
  } else if (score >= 60 && score <= 69) {
    print("Grade: D");
  } else if (score < 60) {
    print("Grade: F");
  } else {
    print("Invalid score");
  }
}
