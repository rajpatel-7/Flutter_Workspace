List<int> findMinMax(List<int> numbers) {
  int smallest = numbers[0];
  int largest = numbers[0];

  for (int num in numbers) {
    if (num < smallest) smallest = num;
    if (num > largest) largest = num;
  }

  return [smallest, largest];
}

void main() {
  List<int> nums = [23, 1, 45, 78, 5, 99, 2];
  List<int> result = findMinMax(nums);

  print("Smallest number: ${result[0]}");
  print("Largest number: ${result[1]}");
}
