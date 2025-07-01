import 'dart:io';

void main() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync()!);

  int yearsLeft = 100 - age;
  print("Welcome $name! You will turn 100 in $yearsLeft years.");
}
