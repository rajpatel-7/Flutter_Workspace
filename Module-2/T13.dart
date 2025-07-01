import 'dart:io';

void main() {
  stdout.write("Enter a list of integers separated by space: ");
  List<int> numbers = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // Ascending Sort - Bubble Sort
  for (int i = 0; i < numbers.length - 1; i++) {
    for (int j = 0; j < numbers.length - i - 1; j++) {
      if (numbers[j] > numbers[j + 1]) {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }

  print("Ascending: $numbers");

  // Descending - reverse manually
  List<int> descending = List.from(numbers.reversed);
  print("Descending: $descending");
}
