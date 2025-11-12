import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePageApp());
}

class ProfilePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePageScreen(),
    );
  }
}

class ProfilePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Profile image
          Positioned(
            top: 50, // Position the image 50 units from the top
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          // Profile details
          Positioned(
            bottom: 30, // Position the details 30 units from the bottom
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Flutter Developer\nLoves to build mobile apps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
