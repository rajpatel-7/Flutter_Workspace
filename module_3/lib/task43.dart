import 'package:flutter/material.dart';

void main() {
  runApp(MyApp43());
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;

  ProfileCard({required this.name, required this.imageUrl, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile image
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            // Name and Bio
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Bio
                  Text(
                    bio,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp43 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Card'),
        ),
        body: Center(
          child: ProfileCard(
            name: 'harsh sojitra',
            imageUrl: 'https://www.example.com/profile.jpg', // Replace with a real image URL
            bio: 'A passionate software developer who loves building mobile apps with Flutter. I enjoy learning new technologies and collaborating on interesting projects.',
          ),
        ),
      ),
    );
  }
}
