import 'dart:io';

bool isPalindrome(String text) {
  String reversed = text.split('').reversed.join('');
  return text == reversed;
}

void main() {
  stdout.write("Enter a string: ");
  String input = stdin.readLineSync()!;

  if (isPalindrome(input)) {
    print("\"$input\" is a palindrome.");
  } else {
    print("\"$input\" is not a palindrome.");
  }
}
