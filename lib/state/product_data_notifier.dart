import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/data/product_repository.dart';
import 'package:flutter_http_showcase/model/product.dart';

class ProductDataNotifier extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductDataNotifier(this._productRepository);

  bool _isLoadingProducts = false;

  bool get isLoadingProducts => _isLoadingProducts;

  bool _isLoadingCategories = false;

  bool get isLoadingCategories => _isLoadingCategories;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<void> loadData() async {
    _isLoadingProducts = true;
    _isLoadingCategories = true;
    _errorMessage = null;

    notifyListeners();

    _loadProducts();
    _loadCategories();
  }

  Future<void> _loadProducts() async {
    try {
      final result = await _productRepository.getAllProducts();

      _products = result;
    } on DioException catch (e) {
      _errorMessage = e.message ?? 'Error!';
    }

    _isLoadingProducts = false;

    notifyListeners();
  }

  Future<void> _loadCategories() async {
    try {
      final result = await _productRepository.getAllCategories();

      _categories = result;
    } on DioException catch (e) {
      _errorMessage = e.message ?? 'Error!';
    }

    _isLoadingCategories = false;

    notifyListeners();
  }

  Future<void> createProduct(ProductData product) async {
    try {
      final result = await _productRepository.createProduct(product: product);

      _products?.insert(0, result);

      if (!(_categories?.contains(result.category) ?? true)) {
        _categories?.add(result.category);
      }
    } on DioException catch (e) {
      _errorMessage = e.message ?? 'Error!';
    }

    notifyListeners();
  }

  List<Product>? _products;

  List<Product>? get products => _products
      ?.where(
        (element) => selectedCategories.isEmpty || selectedCategories.contains(element.category),
      )
      .toList();

  Set<String>? _categories;

  Set<String>? get categories => _categories;

  final _selectedCategories = <String>{};

  Set<String> get selectedCategories => _selectedCategories;

  void selectCategory(String category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }

    notifyListeners();
  }
}
