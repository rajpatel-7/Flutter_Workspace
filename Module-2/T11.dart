import 'dart:io';

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  stdout.write("Enter how many Fibonacci numbers to generate: ");
  int count = int.parse(stdin.readLineSync()!);

  print("Fibonacci series:");
  for (int i = 0; i < count; i++) {
    print(fibonacci(i));
  }
}
