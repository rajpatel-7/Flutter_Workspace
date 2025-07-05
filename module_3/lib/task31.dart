import 'package:flutter/material.dart';

void main() {
  runApp(CardUIApp());
}

class CardUIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardUIScreen(),
    );
  }
}

class CardUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card UI with FAB'),
      ),
      body: Stack(
        children: [
          // The card UI
          Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 300,
                height: 200,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This is a sample card with a floating action button positioned at the bottom right.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating Action Button (FAB) positioned at the bottom right
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                // Action when FAB is pressed
                print('FAB Pressed!');
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
