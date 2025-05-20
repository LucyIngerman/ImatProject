// providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:i_mat_project/model/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  

  void addToCart(Map<String, dynamic> product) {
    final index = _items.indexWhere((item) => item.product['id'] == product['id']);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }


    notifyListeners();
  }

  void removeOne(Map<String, dynamic> product) {
    final index = _items.indexWhere((item) => item.product['id'] == product['id']);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeAll(Map<String, dynamic> product) {
    _items.removeWhere((item) => item.product['id'] == product['id']);
    notifyListeners();
  }

  double _parsePrice(String priceString) {
  return double.tryParse(priceString.replaceAll(',', '.').replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
}


  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get totalPrice => _items.fold(
    0,
    (sum, item) =>
        sum + _parsePrice(item.product['price'].toString()) * item.quantity,

  );

  void clear() {
  _items.clear();
  notifyListeners();
}

}
