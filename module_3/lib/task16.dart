import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp16());
}

class MyApp16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> _imageUrls = [
    'https://via.placeholder.com/600x300/0000FF',
    'https://via.placeholder.com/600x300/FF0000',
    'https://via.placeholder.com/600x300/FFFF00',
    'https://via.placeholder.com/600x300/00FF00',
    'https://via.placeholder.com/600x300/FF00FF',
  ];

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Carousel'),
      ),
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _imageUrls.length,
          onPageChanged: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              _imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
