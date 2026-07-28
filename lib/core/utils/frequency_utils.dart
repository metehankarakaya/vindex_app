import 'package:easy_localization/easy_localization.dart';
import 'package:vindex_app/core/constants/app_strings.dart';
import 'package:vindex_app/core/models/frequency.dart';

String labelForFrequency(Frequency frequency) {
  switch (frequency) {
    case Frequency.daily:
      return AppStrings.recurringFrequencyDaily.tr();
    case Frequency.weekly:
      return AppStrings.recurringFrequencyWeekly.tr();
    case Frequency.monthly:
      return AppStrings.recurringFrequencyMonthly.tr();
    case Frequency.yearly:
      return AppStrings.recurringFrequencyYearly.tr();
  }
}
