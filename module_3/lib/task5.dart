import 'package:flutter/material.dart';

void main() {
  runApp(MyApp5());
}

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveRow(),
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Row Layout'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double totalWidth = constraints.maxWidth;
          return Row(
            children: [
              Container(
                width: totalWidth * 0.3,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: totalWidth * 0.4,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: totalWidth * 0.3,
                height: 100,
                color: Colors.blue,
              ),
            ],
          );
        },
      ),
    );
  }
}
