import 'package:flutter/material.dart';

void main() {
  runApp(MyApp41());
}

class RatingWidget extends StatefulWidget {
  final double rating;
  final Function(double) onRatingChanged;

  RatingWidget({required this.rating, required this.onRatingChanged});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  void _onTapRating(int index) {
    setState(() {
      _rating = index.toDouble();
    });
    widget.onRatingChanged(_rating); // Notify parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _onTapRating(index + 1),
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 40,
          ),
        );
      }),
    );
  }
}

class MyApp41 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp41> {
  double _currentRating = 0;

  void _handleRatingChange(double rating) {
    setState(() {
      _currentRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rating Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingWidget(
                rating: _currentRating,
                onRatingChanged: _handleRatingChange,
              ),
              SizedBox(height: 20),
              Text(
                'Your rating: $_currentRating',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
