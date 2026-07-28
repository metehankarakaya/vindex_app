// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionFilter {

 TransactionCategory? get category; TransactionType? get type; DateTime? get startDate; DateTime? get endDate; double? get minAmount; double? get maxAmount; String? get keyword;
/// Create a copy of TransactionFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFilterCopyWith<TransactionFilter> get copyWith => _$TransactionFilterCopyWithImpl<TransactionFilter>(this as TransactionFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFilter&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,category,type,startDate,endDate,minAmount,maxAmount,keyword);

@override
String toString() {
  return 'TransactionFilter(category: $category, type: $type, startDate: $startDate, endDate: $endDate, minAmount: $minAmount, maxAmount: $maxAmount, keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class $TransactionFilterCopyWith<$Res>  {
  factory $TransactionFilterCopyWith(TransactionFilter value, $Res Function(TransactionFilter) _then) = _$TransactionFilterCopyWithImpl;
@useResult
$Res call({
 TransactionCategory? category, TransactionType? type, DateTime? startDate, DateTime? endDate, double? minAmount, double? maxAmount, String? keyword
});




}
/// @nodoc
class _$TransactionFilterCopyWithImpl<$Res>
    implements $TransactionFilterCopyWith<$Res> {
  _$TransactionFilterCopyWithImpl(this._self, this._then);

  final TransactionFilter _self;
  final $Res Function(TransactionFilter) _then;

/// Create a copy of TransactionFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? type = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,Object? keyword = freezed,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as double?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as double?,keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionFilter].
extension TransactionFilterPatterns on TransactionFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionFilter value)  $default,){
final _that = this;
switch (_that) {
case _TransactionFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionFilter value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionCategory? category,  TransactionType? type,  DateTime? startDate,  DateTime? endDate,  double? minAmount,  double? maxAmount,  String? keyword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionFilter() when $default != null:
return $default(_that.category,_that.type,_that.startDate,_that.endDate,_that.minAmount,_that.maxAmount,_that.keyword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionCategory? category,  TransactionType? type,  DateTime? startDate,  DateTime? endDate,  double? minAmount,  double? maxAmount,  String? keyword)  $default,) {final _that = this;
switch (_that) {
case _TransactionFilter():
return $default(_that.category,_that.type,_that.startDate,_that.endDate,_that.minAmount,_that.maxAmount,_that.keyword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionCategory? category,  TransactionType? type,  DateTime? startDate,  DateTime? endDate,  double? minAmount,  double? maxAmount,  String? keyword)?  $default,) {final _that = this;
switch (_that) {
case _TransactionFilter() when $default != null:
return $default(_that.category,_that.type,_that.startDate,_that.endDate,_that.minAmount,_that.maxAmount,_that.keyword);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionFilter extends TransactionFilter {
  const _TransactionFilter({this.category, this.type, this.startDate, this.endDate, this.minAmount, this.maxAmount, this.keyword}): super._();
  

@override final  TransactionCategory? category;
@override final  TransactionType? type;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  double? minAmount;
@override final  double? maxAmount;
@override final  String? keyword;

/// Create a copy of TransactionFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionFilterCopyWith<_TransactionFilter> get copyWith => __$TransactionFilterCopyWithImpl<_TransactionFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionFilter&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,category,type,startDate,endDate,minAmount,maxAmount,keyword);

@override
String toString() {
  return 'TransactionFilter(category: $category, type: $type, startDate: $startDate, endDate: $endDate, minAmount: $minAmount, maxAmount: $maxAmount, keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class _$TransactionFilterCopyWith<$Res> implements $TransactionFilterCopyWith<$Res> {
  factory _$TransactionFilterCopyWith(_TransactionFilter value, $Res Function(_TransactionFilter) _then) = __$TransactionFilterCopyWithImpl;
@override @useResult
$Res call({
 TransactionCategory? category, TransactionType? type, DateTime? startDate, DateTime? endDate, double? minAmount, double? maxAmount, String? keyword
});




}
/// @nodoc
class __$TransactionFilterCopyWithImpl<$Res>
    implements _$TransactionFilterCopyWith<$Res> {
  __$TransactionFilterCopyWithImpl(this._self, this._then);

  final _TransactionFilter _self;
  final $Res Function(_TransactionFilter) _then;

/// Create a copy of TransactionFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? type = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,Object? keyword = freezed,}) {
  return _then(_TransactionFilter(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as double?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as double?,keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
