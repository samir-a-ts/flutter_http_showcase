import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double dimension;

  const Gap({
    required this.dimension,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(dimension),
    );
  }
}
