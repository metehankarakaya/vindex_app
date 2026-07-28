// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagedResponse<T> _$PagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PagedResponse<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  size: (json['size'] as num).toInt(),
);

Map<String, dynamic> _$PagedResponseToJson<T>(
  _PagedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'number': instance.number,
  'size': instance.size,
};
