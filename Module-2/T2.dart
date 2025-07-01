import 'dart:io';

double celsiusToFahrenheit(double celsius) => (celsius * 9/5) + 32;
double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5/9;

void main() {
  stdout.write("Enter 'C' to convert to Fahrenheit or 'F' to convert to Celsius: ");
  String choice = stdin.readLineSync()!.toUpperCase();

  if (choice == 'C') {
    stdout.write("Enter Celsius temperature: ");
    double c = double.parse(stdin.readLineSync()!);
    print("Fahrenheit: ${celsiusToFahrenheit(c)}");
  } else if (choice == 'F') {
    stdout.write("Enter Fahrenheit temperature: ");
    double f = double.parse(stdin.readLineSync()!);
    print("Celsius: ${fahrenheitToCelsius(f)}");
  } else {
    print("Invalid choice");
  }
}
