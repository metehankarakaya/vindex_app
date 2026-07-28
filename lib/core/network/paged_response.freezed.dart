// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagedResponse<T> {

 List<T> get content; int get totalElements; int get totalPages; int get number; int get size;
/// Create a copy of PagedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedResponseCopyWith<T, PagedResponse<T>> get copyWith => _$PagedResponseCopyWithImpl<T, PagedResponse<T>>(this as PagedResponse<T>, _$identity);

  /// Serializes this PagedResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedResponse<T>&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.number, number) || other.number == number)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),totalElements,totalPages,number,size);

@override
String toString() {
  return 'PagedResponse<$T>(content: $content, totalElements: $totalElements, totalPages: $totalPages, number: $number, size: $size)';
}


}

/// @nodoc
abstract mixin class $PagedResponseCopyWith<T,$Res>  {
  factory $PagedResponseCopyWith(PagedResponse<T> value, $Res Function(PagedResponse<T>) _then) = _$PagedResponseCopyWithImpl;
@useResult
$Res call({
 List<T> content, int totalElements, int totalPages, int number, int size
});




}
/// @nodoc
class _$PagedResponseCopyWithImpl<T,$Res>
    implements $PagedResponseCopyWith<T, $Res> {
  _$PagedResponseCopyWithImpl(this._self, this._then);

  final PagedResponse<T> _self;
  final $Res Function(PagedResponse<T>) _then;

/// Create a copy of PagedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? number = null,Object? size = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<T>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedResponse].
extension PagedResponsePatterns<T> on PagedResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _PagedResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PagedResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> content,  int totalElements,  int totalPages,  int number,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.number,_that.size);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> content,  int totalElements,  int totalPages,  int number,  int size)  $default,) {final _that = this;
switch (_that) {
case _PagedResponse():
return $default(_that.content,_that.totalElements,_that.totalPages,_that.number,_that.size);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> content,  int totalElements,  int totalPages,  int number,  int size)?  $default,) {final _that = this;
switch (_that) {
case _PagedResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.number,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PagedResponse<T> implements PagedResponse<T> {
  const _PagedResponse({required final  List<T> content, required this.totalElements, required this.totalPages, required this.number, required this.size}): _content = content;
  factory _PagedResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PagedResponseFromJson(json,fromJsonT);

 final  List<T> _content;
@override List<T> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int totalElements;
@override final  int totalPages;
@override final  int number;
@override final  int size;

/// Create a copy of PagedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedResponseCopyWith<T, _PagedResponse<T>> get copyWith => __$PagedResponseCopyWithImpl<T, _PagedResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PagedResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedResponse<T>&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.number, number) || other.number == number)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),totalElements,totalPages,number,size);

@override
String toString() {
  return 'PagedResponse<$T>(content: $content, totalElements: $totalElements, totalPages: $totalPages, number: $number, size: $size)';
}


}

/// @nodoc
abstract mixin class _$PagedResponseCopyWith<T,$Res> implements $PagedResponseCopyWith<T, $Res> {
  factory _$PagedResponseCopyWith(_PagedResponse<T> value, $Res Function(_PagedResponse<T>) _then) = __$PagedResponseCopyWithImpl;
@override @useResult
$Res call({
 List<T> content, int totalElements, int totalPages, int number, int size
});




}
/// @nodoc
class __$PagedResponseCopyWithImpl<T,$Res>
    implements _$PagedResponseCopyWith<T, $Res> {
  __$PagedResponseCopyWithImpl(this._self, this._then);

  final _PagedResponse<T> _self;
  final $Res Function(_PagedResponse<T>) _then;

/// Create a copy of PagedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? number = null,Object? size = null,}) {
  return _then(_PagedResponse<T>(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<T>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
