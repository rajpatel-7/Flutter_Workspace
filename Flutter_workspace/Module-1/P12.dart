//2. Write a program to make addition, Subtraction, Multiplication and Division of two number
import 'dart:io';

void main(){
  print("enter your first number");
  int a1 = int.parse(stdin.readLineSync().toString());

  print("enter your second number number");
  int a2 = int.parse(stdin.readLineSync().toString());
  int ans=0;
   print("enter your choice");
    print("enter 1 for +");
     print("enter 2 for");
      print("enter 3 for *");
       print("enter 4 for /");
  int choice = int.parse(stdin.readLineSync().toString());

  switch(choice){
    case 1:
     ans=a1+a2;
     print(ans);

    case 1:
     ans=a1+a2;
     print(ans);

    case 2:
     ans=a1-a2;
     print(ans);

    case 3:
     ans=a1*a2;
     print(ans);

    case 4:
     ans=a1~/a2;
     print(ans);

  }


}