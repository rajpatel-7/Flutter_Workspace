import 'dart:io';

int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

void main() {
  stdout.write("Enter a number to calculate factorial: ");
  int number = int.parse(stdin.readLineSync()!);

  print("Factorial of $number is ${factorial(number)}");
}
