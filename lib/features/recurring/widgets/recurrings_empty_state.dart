import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vindex_app/core/widgets/empty_holder.dart';

import '../../../core/constants/app_strings.dart';

class RecurringsEmptyState extends StatelessWidget {
  const RecurringsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyHolder(
        iconData: Icons.repeat_outlined,
        title: AppStrings.recurringNoItemsYet.tr(),
      ),
    );
  }
}
