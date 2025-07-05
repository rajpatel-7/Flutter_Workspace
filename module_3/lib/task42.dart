import 'package:flutter/material.dart';

void main() {
  runApp(MyApp42());
}

class ProgressBar extends StatelessWidget {
  final double percentage; // The percentage of the progress (0 to 100)

  ProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    // Ensure the percentage is between 0 and 100
    final double clampedPercentage = percentage.clamp(0.0, 100.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Background color of the progress bar
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: 3 * clampedPercentage, // Multiply by 3 to scale from 0-100 to 0-300 width
                decoration: BoxDecoration(
                  color: Colors.blue, // Color of the progress bar
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          '${clampedPercentage.toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class MyApp42 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp42> {
  double _percentage = 50.0; // Initial progress (50%)

  // Method to update the progress bar
  void _updateProgress(double value) {
    setState(() {
      _percentage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom ProgressBar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProgressBar(percentage: _percentage), // Display the progress bar
              SizedBox(height: 20),
              // Slider to adjust the percentage value
              Slider(
                value: _percentage,
                min: 0,
                max: 100,
                onChanged: _updateProgress,
                label: '${_percentage.toStringAsFixed(0)}%',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
