//reverse number

import 'dart:io';

void main() {
   print("Enter Your Number");
  int num = int.parse(stdin.readLineSync().toString());
 int a=0;
    while (num > 0) {
      int digit = num % 10;
      a = a * 10 + digit;
      num = num ~/ 10; 
    }

    print("Reversed number: $a");
  } 