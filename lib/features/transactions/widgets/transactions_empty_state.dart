import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vindex_app/core/widgets/empty_holder.dart';

import '../../../core/constants/app_strings.dart';

class TransactionsEmptyState extends StatelessWidget {
  const TransactionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: EmptyHolder(
          iconData: Icons.receipt_long_outlined,
          title: AppStrings.transactionsNoTransactionsYet.tr(),
        ),
      ),
    );
  }
}
