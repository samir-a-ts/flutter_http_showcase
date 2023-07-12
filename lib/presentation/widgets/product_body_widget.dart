import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/presentation/widgets/gap.dart';
import 'package:flutter_http_showcase/presentation/widgets/loading_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/product_card_widget.dart';
import 'package:flutter_http_showcase/state/product_data_notifier.dart';
import 'package:provider/provider.dart';

class ProductBodyWidget extends StatefulWidget {
  const ProductBodyWidget({super.key});

  @override
  State<ProductBodyWidget> createState() => _ProductBodyWidgetState();
}

class _ProductBodyWidgetState extends State<ProductBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductDataNotifier>(context);

    if (productNotifier.isLoadingProducts) {
      return const LoadingWidget();
    }

    final products = productNotifier.products ?? [];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemCount: products.length,
      separatorBuilder: (context, index) => const Gap(dimension: 10),
      itemBuilder: (context, index) => ProductCardWidget(
        product: products[index],
      ),
    );
  }
}
