// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardService)
final dashboardServiceProvider = DashboardServiceProvider._();

final class DashboardServiceProvider
    extends
        $FunctionalProvider<
          DashboardService,
          DashboardService,
          DashboardService
        >
    with $Provider<DashboardService> {
  DashboardServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardServiceHash();

  @$internal
  @override
  $ProviderElement<DashboardService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardService create(Ref ref) {
    return dashboardService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardService>(value),
    );
  }
}

String _$dashboardServiceHash() => r'591d9209bc9c59a2c85efe96dcf0e2aca6f93031';
