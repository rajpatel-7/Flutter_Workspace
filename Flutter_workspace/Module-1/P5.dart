//e. Write a program you have to print the Fibonacci series up to user given number
import 'dart:io';

void main() {
  print("Enter how many step your want:");
  int a = int.parse(stdin.readLineSync().toString());
  
 int number1=0;
 int number2=1;
  print(number1);
  print(number2);
 int number3=0;
  for(int i=3;i<=a;i++){
    number3=number1+number2;
    number1=number2;
    number2=number3;
     print(number3); 
  };
 
}
