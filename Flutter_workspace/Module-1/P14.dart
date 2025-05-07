//4. Write a program to find the Area of Circle
import 'dart:io';
void main(){    
  print("Enter Your redius");
  int num = int.parse(stdin.readLineSync().toString());
  var area=(3.14)*num*num;
  print("Ans=$area");

}