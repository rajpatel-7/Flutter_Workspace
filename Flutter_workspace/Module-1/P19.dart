//10. Write a Program to check the given number is prime or not prime.
import 'dart:io';
void main(){
   print("enter your number");
    int n=int.parse(stdin.readLineSync().toString());
    int count=0;
   for(int i=1;i<=n;i++){
    if(n%2==0){
      count++;
    }
   }
   if(count<3){
    print("number is prime");
   }
}