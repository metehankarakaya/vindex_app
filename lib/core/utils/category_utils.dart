import 'package:flutter/material.dart';
import 'package:vindex_app/core/models/transaction_category.dart';

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
  // TODO: easy_localization kurulunca gerçek çeviri anahtarlarına çevrilecek
  switch (category) {
    case TransactionCategory.market:
      return 'Market';
    case TransactionCategory.restaurant:
      return 'Restaurant';
    case TransactionCategory.transportation:
      return 'Transportation';
    case TransactionCategory.subscriptions:
      return 'Subscriptions';
    case TransactionCategory.bills:
      return 'Bills';
    case TransactionCategory.health:
      return 'Health';
    case TransactionCategory.entertainment:
      return 'Entertainment';
    case TransactionCategory.salary:
      return 'Salary';
    case TransactionCategory.other:
      return 'Other';
  }
}
