import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_http_showcase/model/product.dart';
import 'package:http/http.dart' as http;

/// Отвечает за загрузку/обновление данных о товарах.
class ProductRepository {
  static const _getAllProductsUri = 'https://dummyjson.com/products';

  static const _getAllCategoriesUri = 'https://dummyjson.com/products/categories';

  static const _postProductUri = 'https://dummyjson.com/products/add';

  final Dio _dio;

  ProductRepository(this._dio);

  Future<List<Product>> getAllProducts() async {
    final request = await http.get(
      Uri.parse(_getAllProductsUri),
    );

    final resposneBody = jsonDecode(request.body) as Map;

    final rawProductsList = resposneBody['products'] as List;

    return rawProductsList
        .map(
          (e) => Product.fromJson(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<Set<String>> getAllCategories() async {
    final request = await _dio.get<List>(_getAllCategoriesUri);

    return request.data!.cast<String>().toSet();
  }

  Future<Product> createProduct({
    required ProductData product,
  }) async {
    final request = await _dio.post<Map>(
      _postProductUri,
      data: product.toJson(),
    );

    return Product.fromJson(
      request.data as Map<String, dynamic>,
    );
  }
}
