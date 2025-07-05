import 'package:flutter/material.dart';

void main() {
  runApp(MyApp7());
}

class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGrid(),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150/0000FF',
    'https://via.placeholder.com/150/FF0000',
    'https://via.placeholder.com/150/FFFF00',
    'https://via.placeholder.com/150/00FF00',
    'https://via.placeholder.com/150/FF00FF',
    'https://via.placeholder.com/150/00FFFF',
    'https://via.placeholder.com/150/888888',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
