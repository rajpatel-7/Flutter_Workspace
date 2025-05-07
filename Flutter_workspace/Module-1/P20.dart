//Write a program of to find out the Area of Triangle, Rectangle and Circle 
import 'dart:io';
class cal{
  
      var pi=3.14;
      double a=0.5;
      double ans=0;
      cal.Triangle(var b,var c){
           ans=a*b*c;
           print(ans);
      }
      cal.Rectangle(var b,var c){
           ans=b*c;
           print(ans);
      }
      cal.Circle(var b){
           ans=pi*b*b;
           print(ans);
      }
}

void main(){
    print("enter your choise");
       print("enter 1 to find a area of triangle");
          print("enter 2 to find a area of Rectangle");
             print("enter 3 to find a area of circle");
    
     int n=int.parse(stdin.readLineSync().toString());

     switch(n){
       case 1:
       print("enter your values:");
        int n1=int.parse(stdin.readLineSync().toString());
        int n2=int.parse(stdin.readLineSync().toString()); 
        cal.Triangle(n1,n2);
     
     case 2:
       print("enter your values:");
        int n1=int.parse(stdin.readLineSync().toString());
        int n2=int.parse(stdin.readLineSync().toString()); 
        cal.Rectangle(n1,n2);
     
     case 3:
       print("enter your values:");
        int n1=int.parse(stdin.readLineSync().toString());
        cal.Circle(n1);
     }
     
}