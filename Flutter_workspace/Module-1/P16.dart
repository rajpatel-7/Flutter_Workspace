// 7. Write a program to calculate sum of 5 subjects & find the percentage.
// Subject marks entered by user.

import 'dart:io';
  void main(){
    print("enter your 5 subject marks");
    var sub1=int.parse(stdin.readLineSync().toString());
    var sub2 = int.parse(stdin.readLineSync().toString());
    var sub3 = int.parse(stdin.readLineSync().toString());
    var sub4 = int.parse(stdin.readLineSync().toString());
    var sub5 = int.parse(stdin.readLineSync().toString());

   int sum=sub1+sub2+sub3+sub4+sub5;
   print("sum of all marks is $sum");

   int per=sum~/5;
   print("percentage is = $per");

  }