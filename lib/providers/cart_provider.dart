import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem newItem) {
    final exists = _items.any((item) => item.name == newItem.name);

    if (!exists) {
      _items.add(newItem);
      notifyListeners();
    }
  }


  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
