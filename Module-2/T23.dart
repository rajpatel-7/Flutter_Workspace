import 'dart:io';

void main() {
  double num1, num2;
  String operator;

  try {
    stdout.write("Enter first number: ");
    num1 = double.parse(stdin.readLineSync()!);

    stdout.write("Enter operator (+, -, *, /): ");
    operator = stdin.readLineSync()!;

    stdout.write("Enter second number: ");
    num2 = double.parse(stdin.readLineSync()!);

    double result;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) throw Exception("Division by zero");
        result = num1 / num2;
        break;
      default:
        throw Exception("Invalid operator");
    }

    print("Result: $result");

  } on FormatException {
    print("Invalid input! Please enter valid numbers.");
  } catch (e) {
    print("Error: $e");
  }
}
