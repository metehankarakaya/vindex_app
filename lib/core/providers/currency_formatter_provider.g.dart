// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_formatter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currencyFormatter)
final currencyFormatterProvider = CurrencyFormatterProvider._();

final class CurrencyFormatterProvider
    extends $FunctionalProvider<NumberFormat, NumberFormat, NumberFormat>
    with $Provider<NumberFormat> {
  CurrencyFormatterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyFormatterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyFormatterHash();

  @$internal
  @override
  $ProviderElement<NumberFormat> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NumberFormat create(Ref ref) {
    return currencyFormatter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NumberFormat value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NumberFormat>(value),
    );
  }
}

String _$currencyFormatterHash() => r'd1f6f764f3eab19b57b2127335e845868a3e6030';
