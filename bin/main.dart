import 'dart:io';

import '../lib/cart.dart';
import '../utils/utils.dart';


void main() {
  final cart = Cart();
  while (true) {
    stdout
        .write('What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();
    if (line == 'a') {
      // stdout.write('add items selected\n');
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'v') {
      print(cart);
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

