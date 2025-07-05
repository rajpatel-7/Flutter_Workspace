import 'package:flutter/material.dart';

void main() {
  runApp(MyApp15());
}

class MyApp15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGallery(),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/150/0000FF',
    'https://via.placeholder.com/150/FF0000',
    'https://via.placeholder.com/150/FFFF00',
    'https://via.placeholder.com/150/00FF00',
    'https://via.placeholder.com/150/FF00FF',
    'https://via.placeholder.com/150/00FFFF',
    'https://via.placeholder.com/150/888888',
    'https://via.placeholder.com/150/000000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: GridView.builder(
        itemCount: imageUrls.length + 1, // One extra item for local image
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          if (index == imageUrls.length) {
            // Local image from assets
            return GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Local Image with BoxFit.cover', style: TextStyle(fontWeight: FontWeight.bold)),
                  Image.asset(
                    'assets/local_image.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover, // Experimenting with BoxFit.cover
                  ),
                ],
              ),
            );
          } else {
            // Remote images from URLs
            return GridTile(
              child: Image.network(
                imageUrls[index],
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}
