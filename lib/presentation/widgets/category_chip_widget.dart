import 'package:flutter/material.dart';

class CategoryChipWidget extends StatelessWidget {
  final String category;

  final bool isSelected;

  const CategoryChipWidget({
    required this.category,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(.1),
          ),
        ],
        color: Colors.white,
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 18,
          color: isSelected ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}
