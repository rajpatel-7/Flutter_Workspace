List<double> applyFunction(List<int> numbers, double Function(int) operation) {
  return numbers.map(operation).toList();
}

void main() {
  List<int> numbers = [2, 4, 6, 8];

  // Define operations
  double square(int x) => x * x.toDouble();
  double cube(int x) => x * x * x.toDouble();
  double half(int x) => x / 2;

  print('Squares: ${applyFunction(numbers, square)}');
  print('Cubes: ${applyFunction(numbers, cube)}');
  print('Halves: ${applyFunction(numbers, half)}');
}
