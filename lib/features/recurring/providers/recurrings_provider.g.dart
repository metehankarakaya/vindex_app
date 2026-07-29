// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Recurrings)
final recurringsProvider = RecurringsProvider._();

final class RecurringsProvider
    extends $NotifierProvider<Recurrings, RecurringsState> {
  RecurringsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recurringsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recurringsHash();

  @$internal
  @override
  Recurrings create() => Recurrings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecurringsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecurringsState>(value),
    );
  }
}

String _$recurringsHash() => r'9fd8a0b8e3eee093d67c178f5de3c5d44ee11af2';

abstract class _$Recurrings extends $Notifier<RecurringsState> {
  RecurringsState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RecurringsState, RecurringsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecurringsState, RecurringsState>,
              RecurringsState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
