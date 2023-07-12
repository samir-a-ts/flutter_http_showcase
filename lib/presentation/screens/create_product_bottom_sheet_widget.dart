import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/presentation/widgets/bottom_sheet_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/gap.dart';
import 'package:flutter_http_showcase/presentation/widgets/text_input.dart';
import 'package:flutter_http_showcase/state/new_product_notifier.dart';

class CreateProductBottomSheetWidget extends StatelessWidget {
  CreateProductBottomSheetWidget({super.key});

  final _productNotifier = NewProductNotifier();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextInput(
                label: "Название",
                onInput: (value) => _productNotifier.name = value,
              ),
              const Gap(dimension: 20),
              TextInput(
                label: "Описание",
                onInput: (value) => _productNotifier.description = value,
              ),
              const Gap(dimension: 20),
              TextInput(
                label: "Категория",
                onInput: (value) => _productNotifier.category = value,
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 80,
          child: Center(
            child: ListenableBuilder(
              listenable: _productNotifier,
              builder: (ctx, child) {
                final product = _productNotifier.buildProduct();

                if (product == null) return const SizedBox();

                return TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(product);
                  },
                  child: const Text('Создать'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
