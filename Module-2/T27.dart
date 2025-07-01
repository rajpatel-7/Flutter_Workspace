Future<String> fetchUser(int id) async {
  await Future.delayed(Duration(seconds: 1));
  return 'User $id loaded';
}

Future<void> fetchAllUsers() async {
  List<Future<String>> futures = [];

  for (int i = 1; i <= 5; i++) {
    futures.add(fetchUser(i));
  }

  List<String> results = await Future.wait(futures);

  print('All users loaded:\n');
  for (var result in results) {
    print(result);
  }
}

void main() {
  fetchAllUsers();
}
