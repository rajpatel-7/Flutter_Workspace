import 'package:flutter/material.dart';

void main() {
  runApp(ProductListingApp());
}

class ProductListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListingScreen(),
    );
  }
}

class ProductListingScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'price': '\$10',
      'image': 'https://via.placeholder.com/150/0000FF/808080?Text=Product1'
    },
    {
      'name': 'Product 2',
      'price': '\$15',
      'image': 'https://via.placeholder.com/150/FF0000/FFFFFF?Text=Product2'
    },
    {
      'name': 'Product 3',
      'price': '\$20',
      'image': 'https://via.placeholder.com/150/00FF00/FFFFFF?Text=Product3'
    },
    {
      'name': 'Product 4',
      'price': '\$25',
      'image': 'https://via.placeholder.com/150/FFFF00/FFFFFF?Text=Product4'
    },
    {
      'name': 'Product 5',
      'price': '\$30',
      'image': 'https://via.placeholder.com/150/FF00FF/FFFFFF?Text=Product5'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    product['image']!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    product['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product['price']!,
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
