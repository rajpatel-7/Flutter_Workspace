//f. write a program you have to print the table of given number.
import 'dart:io';

void main() {
  print("Enter your number");
  int a = int.parse(stdin.readLineSync().toString());
 int b=0;
  for(int i=1;i<=10;i++){
     b=a*i; 
    print("$a * $i = $b"); 
  };
 
}