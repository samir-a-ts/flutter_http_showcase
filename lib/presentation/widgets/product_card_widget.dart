import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/model/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.title),
              Text(product.description),
              Text('Category: ${product.category}'),
            ],
          ),
        ),
      ),
    );
  }
}
