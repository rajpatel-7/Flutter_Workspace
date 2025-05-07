//h .Write a program to find out the max from given number (E.g. No: -1562 Max number is 6 )
import 'dart:io';

void main() {
   print("Enter Your Number");
  int num = int.parse(stdin.readLineSync().toString());
  int max=0;
  while(num!=0){
      int rem1=num%10;
      if(rem1>max){
          max=rem1;
      }
      num=num~/10;
  }
  
  print(max);
} 
