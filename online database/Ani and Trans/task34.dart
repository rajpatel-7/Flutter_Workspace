import 'package:flutter/material.dart';

void main() {
  runApp(MyApp34());
}

class MyApp34 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expandable Section Example'),
        ),
        body: ExpandableContent(),
      ),
    );
  }
}

class ExpandableContent extends StatefulWidget {
  @override
  _ExpandableContentState createState() => _ExpandableContentState();
}

class _ExpandableContentState extends State<ExpandableContent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? 200 : 0, 
          width: double.infinity,
          padding: EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: _isExpanded
              ? Text(
            'This is the expanded content. You can add more widgets here.',
            style: TextStyle(color: Colors.white),
          )
              : null,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded; 
            });
          },
          child: Text(_isExpanded ? 'Collapse' : 'Expand'),
        ),
      ],
    );
  }
}

