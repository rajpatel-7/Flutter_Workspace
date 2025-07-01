import 'dart:io';

void main() {
  stdout.write("Enter a list of integers separated by space: ");
  String input = stdin.readLineSync()!;
  List<String> parts = input.split(' ');
  List<int> numbers = [];

  try {
    for (var part in parts) {
      numbers.add(int.parse(part));
    }
    print("Valid Integer List: $numbers");
  } on FormatException {
    print("Error: All inputs must be integers.");
  }
}
