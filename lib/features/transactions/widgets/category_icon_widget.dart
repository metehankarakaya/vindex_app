import 'package:flutter/material.dart';
import 'package:vindex_app/core/models/transaction_category.dart';
import 'package:vindex_app/core/utils/category_utils.dart';

class CategoryIconWidget extends StatelessWidget {
  final TransactionCategory category;
  const CategoryIconWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final color = colorForCategory(category);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        iconForCategory(category),
        color: color,
        size: 24,
      ),
    );
  }
}
