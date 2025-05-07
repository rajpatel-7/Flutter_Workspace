//sum of first and last digit
import 'dart:io';

void main()
{
  print("Enter Your Number");
  int a = int.parse(stdin.readLineSync().toString());
  int sum=0;
  int count=0;
  int num=a;
  int rem;
  while(num>0)
  {
     rem = num % 10;
    num = num ~/ 10;
    count++;
  }
  
  for(int i=1;i<=count;i++){
       rem = a % 10;
     a = a ~/ 10;
      if(i==1 || i==count){
          sum=sum+rem;
      }
  }
 print(sum);
}



