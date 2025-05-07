//1. Display This Information using println
// a. Your Name
// b. Your Birth date
// c. Your Age
// d. Your Address

import 'dart:io';
  void main(){
    var Name = stdin.readLineSync().toString();
    var Bdate = stdin.readLineSync().toString();
    var Age = stdin.readLineSync().toString();
    var Address = stdin.readLineSync().toString();

    print("Your name is $Name");
    print("Your Birth date is $Bdate");
    print("Your Age is $Age");
    print("Your Address is $Address");

  }