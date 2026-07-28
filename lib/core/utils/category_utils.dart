import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vindex_app/core/models/transaction_category.dart';

import '../constants/app_strings.dart';

IconData iconForCategory(TransactionCategory category) {
  switch (category) {
    case TransactionCategory.market:
      return Icons.shopping_cart;
    case TransactionCategory.restaurant:
      return Icons.restaurant;
    case TransactionCategory.transportation:
      return Icons.directions_car;
    case TransactionCategory.subscriptions:
      return Icons.subscriptions;
    case TransactionCategory.bills:
      return Icons.receipt_long;
    case TransactionCategory.health:
      return Icons.local_hospital;
    case TransactionCategory.entertainment:
      return Icons.movie;
    case TransactionCategory.salary:
      return Icons.attach_money;
    case TransactionCategory.other:
      return Icons.category;
  }
}

Color colorForCategory(TransactionCategory category) {
  switch (category) {
    case TransactionCategory.market:
      return Colors.blue;
    case TransactionCategory.restaurant:
      return Colors.orange;
    case TransactionCategory.transportation:
      return Colors.purple;
    case TransactionCategory.subscriptions:
      return Colors.pink;
    case TransactionCategory.bills:
      return Colors.teal;
    case TransactionCategory.health:
      return Colors.redAccent;
    case TransactionCategory.entertainment:
      return Colors.indigo;
    case TransactionCategory.salary:
      return Colors.green;
    case TransactionCategory.other:
      return Colors.grey;
  }
}

String labelForCategory(TransactionCategory category) {
  switch (category) {
    case TransactionCategory.market:
      return AppStrings.categoryMarket.tr();
    case TransactionCategory.restaurant:
      return AppStrings.categoryRestaurant.tr();
    case TransactionCategory.transportation:
      return AppStrings.categoryTransportation.tr();
    case TransactionCategory.subscriptions:
      return AppStrings.categorySubscriptions.tr();
    case TransactionCategory.bills:
      return AppStrings.categoryBills.tr();
    case TransactionCategory.health:
      return AppStrings.categoryHealth.tr();
    case TransactionCategory.entertainment:
      return AppStrings.categoryEntertainment.tr();
    case TransactionCategory.salary:
      return AppStrings.categorySalary.tr();
    case TransactionCategory.other:
      return AppStrings.categoryOther.tr();
  }
}
