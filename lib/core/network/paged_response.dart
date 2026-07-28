import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response.freezed.dart';
part 'paged_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PagedResponse<T> with _$PagedResponse<T> {
  const factory PagedResponse({
    required List<T> content,
    required int totalElements,
    required int totalPages,
    required int number,
    required int size,
  }) = _PagedResponse<T>;

  factory PagedResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT,) => _$PagedResponseFromJson(json, fromJsonT);
}
