//d .write a program you have to find the factorial of given number.
import 'dart:io';

void main() {
  print("Enter your number:");
  int a = int.parse(stdin.readLineSync().toString());

  int sum = 1;
  for (int i = 1; i <= a; i++) {
    sum = sum * i;
  }

  print("Ans of factorial is = $sum");
}
