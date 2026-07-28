import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vindex_app/core/constants/app_strings.dart';

class RecurringCancelDialog {
  RecurringCancelDialog._();

  static Future<bool> show(BuildContext context, String title) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppStrings.recurringCancelDialogTitle.tr()),
        content: Text(
          AppStrings.recurringCancelDialogBody.tr(
            namedArgs: {'title': title.isEmpty ? AppStrings.recurringUnnamedItem.tr() : title},
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppStrings.recurringKeepIt.tr()),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(AppStrings.recurringCancelIt.tr()),
          ),
        ],
      ),
    );

    return confirmed ?? false;
  }
}
