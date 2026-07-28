import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_visibility_provider.g.dart';

@riverpod
class BalanceVisibility extends _$BalanceVisibility {
  @override
  bool build() => true; // varsayılan: bakiye görünür

  void toggle() => state = !state;
}
