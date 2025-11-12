import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Cart Provider
class CartProvider with ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
}

// Product List Screen
class ProductListScreen extends StatelessWidget {
  final List<String> products = ["Apple", "Banana", "Orange", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addItem(products[index]);
              },
              child: Text("Add"),
            ),
          );
        },
      ),
    );
  }
}

// Cart Screen
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return cart.items.isEmpty
              ? Center(child: Text("Cart is empty"))
              : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.removeItem(cart.items[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Main Function
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    ),
  );
}
