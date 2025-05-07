//sum of all digits
import 'dart:io';

void main()
{
  print("Enter Your Number");
  int num = int.parse(stdin.readLineSync().toString());

  int sum=0;
  while(num>0)
  {
    int rem = num % 10;
    sum+=rem;
    num = num ~/ 10;
  }
  print("sum of all digits: $sum");

}



