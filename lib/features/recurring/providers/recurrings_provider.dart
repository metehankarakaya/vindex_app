import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vindex_app/core/models/recurring_model.dart';
import 'package:vindex_app/features/recurring/models/recurrings_state.dart';
import 'package:vindex_app/features/recurring/services/recurring_service.dart';

part 'recurrings_provider.g.dart';

@Riverpod(keepAlive: true)
class Recurrings extends _$Recurrings {

  @override
  RecurringsState build() {
    return const RecurringsState(isLoading: true);
  }

  Future<void> loadAll() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final service = ref.read(recurringServiceProvider);
      final items = await service.getRecurrings();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> createRecurring(RecurringModel recurring) async {
    final service = ref.read(recurringServiceProvider);
    await service.createRecurring(recurring);
    await loadAll();
  }

  Future<void> deleteRecurring(String id) async {
    final service = ref.read(recurringServiceProvider);
    await service.deleteRecurring(id);
    state = state.copyWith(items: state.items.where((r) => r.id != id).toList());
  }

  Future<void> deleteAllRecurrings() async {
    final service = ref.read(recurringServiceProvider);
    await service.deleteAllRecurrings();
    state = state.copyWith(items: []);
  }

}
