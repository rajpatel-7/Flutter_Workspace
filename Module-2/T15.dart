import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
  String input = stdin.readLineSync()!;
  Map<String, int> frequency = {};

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    frequency[char] = (frequency[char] ?? 0) + 1;
  }

  print("Character frequencies:");
  frequency.forEach((key, value) {
    print("$key: $value");
  });
}
