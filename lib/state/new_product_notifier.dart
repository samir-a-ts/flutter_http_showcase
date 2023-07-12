import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/model/product.dart';

class NewProductNotifier extends ChangeNotifier {
  String _name = '';

  set name(String value) {
    _name = value;

    notifyListeners();
  }

  String _description = '';

  set description(String value) {
    _description = value;

    notifyListeners();
  }

  String _category = '';

  set category(String value) {
    _category = value;

    notifyListeners();
  }

  ProductData? buildProduct() {
    if (_name.isNotEmpty && _description.isNotEmpty && _category.isNotEmpty) {
      return ProductData(
        title: _name,
        description: _description,
        category: _category,
      );
    }

    return null;
  }
}
