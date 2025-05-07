//3. Write a program to make a square and cube of number.
import 'dart:io';

void main()
{
  print("Enter Your Number");
  int num = int.parse(stdin.readLineSync().toString());
  int ans1=num*num;
  int ans2=num*num*num;
  print(ans1);
  print(ans2);


}



