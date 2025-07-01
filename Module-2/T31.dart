Stream<int> numberStream(int maxCount) async* {
  for (int i = 1; i <= maxCount; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (int value in numberStream(5)) {
    print('Received: $value');
  }
}
