import 'package:flutter/material.dart';

void main() {
  runApp(MyApp12());
}

class MyApp12 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp12> {
  bool _isSwitched = false;

  // This function toggles the switch and updates the background color
  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toggle Background Color'),
        ),
        body: Container(
          color: _isSwitched ? Colors.blue : Colors.white,
          child: Center(
            child: SwitchListTile(
              title: Text('Switch Background Color'),
              value: _isSwitched,
              onChanged: _toggleSwitch,
            ),
          ),
        ),
      ),
    );
  }
}
