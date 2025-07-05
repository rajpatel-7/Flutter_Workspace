import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Screen App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/productList': (context) => ProductListScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/productList');
          },
          child: Text('Go to Product List'),
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'id': '1', 'name': 'Product 1', 'description': 'This is Product 1'},
    {'id': '2', 'name': 'Product 2', 'description': 'This is Product 2'},
    {'id': '3', 'name': 'Product 3', 'description': 'This is Product 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: {
                  'id': product['id'],
                  'name': product['name'],
                  'description': product['description'],
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product ID: ${arguments['id']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Name: ${arguments['name']}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Description: ${arguments['description']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
