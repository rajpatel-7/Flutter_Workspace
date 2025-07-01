import 'dart:io';

void main() {
  const double pi = 3.14159;

  stdout.write("Enter the radius of the circle: ");
  double radius = double.parse(stdin.readLineSync()!);

  double area = pi * radius * radius;
  double circumference = 2 * pi * radius;

  print("Area of the circle: $area");
  print("Circumference of the circle: $circumference");
}
