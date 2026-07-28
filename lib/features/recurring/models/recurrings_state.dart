import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vindex_app/core/models/recurring_model.dart';

part 'recurrings_state.freezed.dart';

@freezed
abstract class RecurringsState with _$RecurringsState {
  const factory RecurringsState({
    @Default([]) List<RecurringModel> items,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _RecurringsState;
}
