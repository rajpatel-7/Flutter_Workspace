import 'package:flutter/material.dart';

void main() {
  runApp(MyApp35());
}

class MyApp35 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pulsing Button Example'),
        ),
        body: Center(
          child: PulsingButton(),
        ),
      ),
    );
  }
}

class PulsingButton extends StatefulWidget {
  @override
  _PulsingButtonState createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton> {
  bool _isPulsing = false;

  @override
  void initState() {
    super.initState();
    _startPulsing();
  }

  void _startPulsing() {
    setState(() {
      _isPulsing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1.0, end: _isPulsing ? 1.2 : 1.0),
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      onEnd: () {
        setState(() {
          _isPulsing = !_isPulsing; 
        });
      },
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: ElevatedButton(
            onPressed: () {
              print('Button Pressed!');
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Colors.blue,
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}

