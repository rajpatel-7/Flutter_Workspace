//5. Write a program to find the Area of Triangle

import 'dart:io';
void main(){    
  print("Enter Your a");
  int num1 = int.parse(stdin.readLineSync().toString());
   print("Enter Your b");
  int num2 = int.parse(stdin.readLineSync().toString());
  var area=(0.5)*num1*num2;
  print("Ans=$area");

}