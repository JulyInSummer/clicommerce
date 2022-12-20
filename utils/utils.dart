import 'dart:io';

import '../lib/cart.dart';
import '../lib/product.dart';


const allProducts = [
  Product(id: 1, name: 'apple', price: 25),
  Product(id: 2, name: 'pineapple', price: 20),
  Product(id: 3, name: 'banana', price: 15),
  Product(id: 4, name: 'lime', price: 16.7),
  Product(id: 5, name: 'orange', price: 20.4),
  Product(id: 6, name: 'grape', price: 30.8),
];

Product? chooseProduct() {
  final productsList = allProducts.map((e) => e.displayName).join('\n');
  stdout.write('All products:\n$productsList\nYour choice ');
  final line = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Not found!');
  return null;
}

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('Cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total: \$$total');
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print('Change: \$${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash');
    return false;
  }
}
