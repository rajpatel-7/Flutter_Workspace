import 'dart:io';

void main() {
  stdout.write("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter operator (+, -, *, /): ");
  String op = stdin.readLineSync()!;

  stdout.write("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  double result;

  switch (op) {
    case '+':
      result = num1 + num2;
      print("Result: $result");
      break;
    case '-':
      result = num1 - num2;
      print("Result: $result");
      break;
    case '*':
      result = num1 * num2;
      print("Result: $result");
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
        print("Result: $result");
      } else {
        print("Error: Division by zero");
      }
      break;
    default:
      print("Invalid operator");
  }
}
