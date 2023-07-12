import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/data/product_repository.dart';
import 'package:flutter_http_showcase/presentation/screens/product_widget.dart';
import 'package:flutter_http_showcase/state/product_data_notifier.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final Dio _dio;

  late final ProductRepository _productRepository;

  @override
  void initState() {
    _dio = Dio(
      BaseOptions(),
    );

    _productRepository = ProductRepository(_dio);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataNotifier>(
          create: (context) => ProductDataNotifier(_productRepository),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter HTTP Showcase',
        home: ProductDataWidget(),
      ),
    );
  }
}
