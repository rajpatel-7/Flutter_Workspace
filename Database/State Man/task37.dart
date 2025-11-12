import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp37());
}

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class MyApp37 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterNotifier(),
      child: MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CounterDisplay()), // Display the counter
          SizedBox(height: 20),
          CounterControls(), // Buttons to modify the counter
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterNotifier>().counter;
    return Text(
      'Counter Value: $counter',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class CounterControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => context.read<CounterNotifier>().increment(),
          child: Text('Increment'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => context.read<CounterNotifier>().decrement(),
          child: Text('Decrement'),
        ),
      ],
    );
  }
}
