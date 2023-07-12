import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/model/product.dart';
import 'package:flutter_http_showcase/presentation/screens/create_product_bottom_sheet_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/category_body_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/gap.dart';
import 'package:flutter_http_showcase/presentation/widgets/product_body_widget.dart';
import 'package:flutter_http_showcase/state/product_data_notifier.dart';
import 'package:provider/provider.dart';

class ProductDataWidget extends StatefulWidget {
  const ProductDataWidget({super.key});

  @override
  State<ProductDataWidget> createState() => _ProductDataWidgetState();
}

class _ProductDataWidgetState extends State<ProductDataWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDataNotifier>(context, listen: false).loadData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductDataNotifier>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: productNotifier,
          builder: (context, child) {
            if (productNotifier.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(productNotifier.errorMessage!),
                    const Gap(dimension: 10),
                    TextButton(
                      onPressed: () {
                        productNotifier.loadData();
                      },
                      child: const Text('Перезагрузить'),
                    ),
                  ],
                ),
              );
            }

            return const Column(
              children: [
                Gap(dimension: 20),
                CategoryBodyWidget(),
                Gap(dimension: 10),
                Expanded(
                  child: ProductBodyWidget(),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: ListenableBuilder(
        listenable: productNotifier,
        builder: (context, child) {
          if (productNotifier.isLoadingCategories || productNotifier.isLoadingProducts) return const SizedBox();

          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet<ProductData?>(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) => CreateProductBottomSheetWidget(),
              ).then((value) {
                if (value != null) {
                  productNotifier.createProduct(value);
                }
              });
            },
          );
        },
      ),
    );
  }
}
