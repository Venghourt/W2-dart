class Shop {
  final String name;
  final List<Product> products = [];

  Shop(this.name);

  void addProduct(Product product) {
    products.add(product);
  }

  void displayProducts() {
    print('=== Products at $name ===');
    for (var product in products) {
      print('  $product');
    }
    print('');
  }
}

class Customer {
  final String customer_name;
  final String customer_address;

  Customer(this.customer_name, this.customer_address);
  
  @override
  String toString() {
    return 'Name: $customer_name, Address: $customer_address';
  }
}

class Product {
  final int product_id;
  final String product_name;
  final double product_price;

  Product(this.product_id, this.product_name, this.product_price);

  @override
  String toString() {
    return 'Product: $product_name, \$$product_price';
  }
}

class OrderItems {
  final Product product;
  final int quantity;

  OrderItems(this.product, this.quantity);

  double get subtotal => product.product_price * quantity;

  @override
  String toString() {
    return '${product.product_name} x $quantity - \$$subtotal';
  }
}

class Order {
  final int order_id;
  final Customer customer;
  final List<OrderItems> items;

  Order(this.order_id, this.customer, this.items);

  double get totalPrice {
    return items.fold(0.0, (total, item) => total + item.subtotal);
  }

  void displayOrderDetails() {
    print('Order #$order_id');
    print('Customer: $customer');
    print('Items:');
    for (var item in items) {
      print('  $item');
    }
    print('Total: \$$totalPrice');
    print('---');
  }
}

void main() {
  var myShop = Shop('CADT Shop!');
  var book = Product(10, 'Book', 14.99);
  var waterbottle = Product(2, 'Water Bottle', 24.99);
  var shoes = Product(3, 'Shoes', 59.99);
  var shirt = Product(4, 'Shirt', 9.99);

  myShop.addProduct(book);
  myShop.addProduct(waterbottle);
  myShop.addProduct(shoes);
  myShop.addProduct(shirt);

  var customer1 = Customer('John Doe', 'National Road 5, Phnom Penh');
  var order1 = Order(1001, customer1, [
    OrderItems(shirt, 1),
    OrderItems(book, 2),
  ]);

  myShop.displayProducts();
  order1.displayOrderDetails();

}