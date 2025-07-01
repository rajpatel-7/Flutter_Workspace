class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print("${product.name} added to cart.");
  }

  double calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void displayCart() {
    print("\n--- Cart Items ---");
    for (var p in products) {
      print("${p.name} - \$${p.price}");
    }
    print("Total Price: \$${calculateTotal()}");
  }
}

class Order {
  Cart cart;

  Order(this.cart);

  void placeOrder() {
    print("\nOrder placed successfully!");
    print("Total amount: \$${cart.calculateTotal()}");
  }
}

void main() {
  Product p1 = Product("Milk", 30.0);
  Product p2 = Product("Bread", 25.0);
  Product p3 = Product("Eggs", 60.0);

  Cart cart = Cart();
  cart.addProduct(p1);
  cart.addProduct(p2);
  cart.addProduct(p3);

  cart.displayCart();

  Order order = Order(cart);
  order.placeOrder();
}
