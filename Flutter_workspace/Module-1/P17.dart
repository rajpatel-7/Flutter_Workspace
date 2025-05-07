//8. Write a Program to check the given number is Positive, Negative.
import 'dart:io';
 void main(){
     print("enter any number");
    var sub1=int.parse(stdin.readLineSync().toString());

    if(sub1>0){
      print("number is pos+");
    }

    else if(sub1==0){
      print("number is zero");

    }
    else{
      print("number is neg-");

    }
 }