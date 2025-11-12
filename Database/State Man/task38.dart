import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp38());
}

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item['price'] * item['quantity']);

  void addItem(Map<String, dynamic> item) {
    int index = _items.indexWhere((i) => i['id'] == item['id']);
    if (index >= 0) {
      _items[index]['quantity'] += 1;
    } else {
      _items.add({...item, 'quantity': 1});
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    int index = _items.indexWhere((item) => item['id'] == id);
    if (index >= 0) {
      if (_items[index]['quantity'] > 1) {
        _items[index]['quantity'] -= 1;
      } else {
        removeItem(id);
      }
      notifyListeners();
    }
  }
}

class MyApp38 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        home: ShoppingCartScreen(),
      ),
    );
  }
}

class ShoppingCartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'id': '1', 'name': 'Apple', 'price': 1.5},
    {'id': '2', 'name': 'Banana', 'price': 0.8},
    {'id': '3', 'name': 'Orange', 'price': 1.2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Consumer<CartProvider>(
                builder: (context, cart, child) => Text(
                  '\$${cart.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text('\$${product['price']}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(product);
                    },
                    child: Text('Add'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cart, child) {
                return cart.items.isEmpty
                    ? Center(child: Text('No items in the cart.'))
                    : ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(
                          '\$${item['price']} x ${item['quantity']} = \$${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .decreaseQuantity(item['id']);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<CartProvider>().removeItem(item['id']);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
