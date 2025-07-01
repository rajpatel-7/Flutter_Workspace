import 'dart:io';

void main() {
  stdout.write("Enter a list of words separated by space: ");
  List<String> words = stdin.readLineSync()!.split(' ');

  Set<String> uniqueWords = Set.from(words); // Removes duplicates
  List<String> sorted = uniqueWords.toList();

  // Manual sorting (Bubble Sort)
  for (int i = 0; i < sorted.length - 1; i++) {
    for (int j = 0; j < sorted.length - i - 1; j++) {
      if (sorted[j].compareTo(sorted[j + 1]) > 0) {
        String temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }

  print("Unique words in alphabetical order: $sorted");
}
