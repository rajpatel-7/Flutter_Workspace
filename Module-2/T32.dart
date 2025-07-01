import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  int secretNumber = random.nextInt(100) + 1; // 1 to 100

  var hint = (int guess) => guess > secretNumber ? "Too high" : "Too low";

  print("Guess the number (between 1 and 100):");

  while (true) {
    stdout.write("Your guess: ");
    int? guess = int.tryParse(stdin.readLineSync()!);

    if (guess == null) {
      print("Invalid input. Please enter a number.");
      continue;
    }

    if (guess == secretNumber) {
      print("🎉 Correct! The number was $secretNumber.");
      break;
    } else {
      print(hint(guess));
    }
  }
}
