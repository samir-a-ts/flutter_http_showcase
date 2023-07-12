import 'package:flutter/material.dart';
import 'package:flutter_http_showcase/presentation/widgets/category_chip_widget.dart';
import 'package:flutter_http_showcase/presentation/widgets/gap.dart';

class CategoryFilterWidget extends StatelessWidget {
  final List<String> categories;

  final Set<String> selectedCategories;

  final ValueChanged<String> onSelected;

  const CategoryFilterWidget({
    required this.categories,
    required this.selectedCategories,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      separatorBuilder: (context, index) => const Gap(dimension: 10),
      itemBuilder: (context, index) {
        final category = categories[index];

        return GestureDetector(
          onTap: () => onSelected(category),
          child: CategoryChipWidget(
            category: category,
            isSelected: selectedCategories.contains(category),
          ),
        );
      },
    );
  }
}
