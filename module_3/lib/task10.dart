import 'package:flutter/material.dart';

void main() {
  runApp(MyApp10());
}

class MyApp10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'price': 1.99},
    {'name': 'Banana', 'price': 0.99},
    {'name': 'Orange', 'price': 2.49},
    {'name': 'Grapes', 'price': 3.99},
  ];

  int _cartCount = 0;

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('$_cartCount'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(items[index]['name']),
              subtitle: Text('\$${items[index]['price'].toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: _addToCart,
                child: Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}
