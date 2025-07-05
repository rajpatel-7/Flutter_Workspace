import 'package:flutter/material.dart';

void main() {
  runApp(MyApp45());
}

class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  AvatarBadge({required this.imageUrl, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Avatar image
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        // Status indicator
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOnline ? Colors.green : Colors.red, // Green for online, red for offline
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyApp45 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Avatar Badge'),
        ),
        body: Center(
          child: AvatarBadge(
            imageUrl: 'https://www.example.com/avatar.jpg',
            isOnline: true,
          ),
        ),
      ),
    );
  }
}
