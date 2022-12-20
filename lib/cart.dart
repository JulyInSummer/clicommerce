import 'product.dart';

class Item {
  const Item({
    required this.product,
    this.quantity = 1,
  });

  final Product product;
  final int quantity;

  double get price => quantity * product.price;

  @override
  String toString() => '$quantity x ${product.name}: \$${price.toStringAsFixed(1)}';
}

class Cart {
  final Map<int, Item> _items = {};
  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  bool get isEmpty => _items.isEmpty;

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemizedList =
        _items.values.map((item) => item.toString()).join('\n');
    return '------\n$itemizedList\nTotal: \$${total()}\n------';
  }
}