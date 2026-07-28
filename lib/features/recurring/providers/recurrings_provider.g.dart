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

String _$recurringsHash() => r'a42ded5db8505f9f22e00cf8e555e01ed3dcd4ad';

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
