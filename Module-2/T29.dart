void main() {
  List<int> list1 = [3, 5, 1, 9];
  List<int> list2 = [7, 3, 2, 1];
  List<int> list3 = [6, 4, 9];

  // Combine using spread operator
  List<int> combined = [...list1, ...list2, ...list3];

  // Remove duplicates using a Set and sort
  List<int> result = combined.toSet().toList()..sort();

  print('Combined and Sorted List: $result');
}
