import 'dart:io';

void main() {
  try {
    stdout.write("Enter numerator: ");
    double num1 = double.parse(stdin.readLineSync()!);

    stdout.write("Enter denominator: ");
    double num2 = double.parse(stdin.readLineSync()!);

    double result = num1 / num2;
    print("Result: $result");
  } on FormatException {
    print("Invalid input. Please enter valid numbers.");
  } on IntegerDivisionByZeroException {
    print("Error: Division by zero is not allowed.");
  } catch (e) {
    print("An error occurred: $e");
  }
}
