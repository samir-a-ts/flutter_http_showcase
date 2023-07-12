import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/presentation/widgets/category_filter_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/loading_widget.dart';
import 'package:flutter_http_showcase/state/product_data_notifier.dart';
import 'package:provider/provider.dart';

class CategoryBodyWidget extends StatelessWidget {
  const CategoryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductDataNotifier>(context, listen: false);

    return SizedBox(
      height: 20,
      width: double.infinity,
      child: ListenableBuilder(
        listenable: productNotifier,
        builder: (context, child) {
          if (productNotifier.isLoadingCategories) {
            return const LoadingWidget();
          }

          return CategoryFilterWidget(
            categories: productNotifier.categories?.toList() ?? [],
            selectedCategories: productNotifier.selectedCategories,
            onSelected: (value) {
              productNotifier.selectCategory(value);
            },
          );
        },
      ),
    );
  }
}
