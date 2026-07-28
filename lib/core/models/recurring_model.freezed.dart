// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecurringModel {

 String? get id; String get title; double get amount; TransactionCategory get category; TransactionType get type; String get currency; Frequency get frequency; DateTime get startDate; DateTime? get endDate; DateTime? get nextDueDate;
/// Create a copy of RecurringModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecurringModelCopyWith<RecurringModel> get copyWith => _$RecurringModelCopyWithImpl<RecurringModel>(this as RecurringModel, _$identity);

  /// Serializes this RecurringModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecurringModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,category,type,currency,frequency,startDate,endDate,nextDueDate);

@override
String toString() {
  return 'RecurringModel(id: $id, title: $title, amount: $amount, category: $category, type: $type, currency: $currency, frequency: $frequency, startDate: $startDate, endDate: $endDate, nextDueDate: $nextDueDate)';
}


}

/// @nodoc
abstract mixin class $RecurringModelCopyWith<$Res>  {
  factory $RecurringModelCopyWith(RecurringModel value, $Res Function(RecurringModel) _then) = _$RecurringModelCopyWithImpl;
@useResult
$Res call({
 String? id, String title, double amount, TransactionCategory category, TransactionType type, String currency, Frequency frequency, DateTime startDate, DateTime? endDate, DateTime? nextDueDate
});




}
/// @nodoc
class _$RecurringModelCopyWithImpl<$Res>
    implements $RecurringModelCopyWith<$Res> {
  _$RecurringModelCopyWithImpl(this._self, this._then);

  final RecurringModel _self;
  final $Res Function(RecurringModel) _then;

/// Create a copy of RecurringModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? amount = null,Object? category = null,Object? type = null,Object? currency = null,Object? frequency = null,Object? startDate = null,Object? endDate = freezed,Object? nextDueDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as Frequency,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecurringModel].
extension RecurringModelPatterns on RecurringModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecurringModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecurringModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecurringModel value)  $default,){
final _that = this;
switch (_that) {
case _RecurringModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecurringModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecurringModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  double amount,  TransactionCategory category,  TransactionType type,  String currency,  Frequency frequency,  DateTime startDate,  DateTime? endDate,  DateTime? nextDueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecurringModel() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.category,_that.type,_that.currency,_that.frequency,_that.startDate,_that.endDate,_that.nextDueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  double amount,  TransactionCategory category,  TransactionType type,  String currency,  Frequency frequency,  DateTime startDate,  DateTime? endDate,  DateTime? nextDueDate)  $default,) {final _that = this;
switch (_that) {
case _RecurringModel():
return $default(_that.id,_that.title,_that.amount,_that.category,_that.type,_that.currency,_that.frequency,_that.startDate,_that.endDate,_that.nextDueDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  double amount,  TransactionCategory category,  TransactionType type,  String currency,  Frequency frequency,  DateTime startDate,  DateTime? endDate,  DateTime? nextDueDate)?  $default,) {final _that = this;
switch (_that) {
case _RecurringModel() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.category,_that.type,_that.currency,_that.frequency,_that.startDate,_that.endDate,_that.nextDueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecurringModel implements RecurringModel {
  const _RecurringModel({this.id, required this.title, required this.amount, required this.category, required this.type, required this.currency, required this.frequency, required this.startDate, this.endDate, this.nextDueDate});
  factory _RecurringModel.fromJson(Map<String, dynamic> json) => _$RecurringModelFromJson(json);

@override final  String? id;
@override final  String title;
@override final  double amount;
@override final  TransactionCategory category;
@override final  TransactionType type;
@override final  String currency;
@override final  Frequency frequency;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  DateTime? nextDueDate;

/// Create a copy of RecurringModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecurringModelCopyWith<_RecurringModel> get copyWith => __$RecurringModelCopyWithImpl<_RecurringModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecurringModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecurringModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,category,type,currency,frequency,startDate,endDate,nextDueDate);

@override
String toString() {
  return 'RecurringModel(id: $id, title: $title, amount: $amount, category: $category, type: $type, currency: $currency, frequency: $frequency, startDate: $startDate, endDate: $endDate, nextDueDate: $nextDueDate)';
}


}

/// @nodoc
abstract mixin class _$RecurringModelCopyWith<$Res> implements $RecurringModelCopyWith<$Res> {
  factory _$RecurringModelCopyWith(_RecurringModel value, $Res Function(_RecurringModel) _then) = __$RecurringModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, double amount, TransactionCategory category, TransactionType type, String currency, Frequency frequency, DateTime startDate, DateTime? endDate, DateTime? nextDueDate
});




}
/// @nodoc
class __$RecurringModelCopyWithImpl<$Res>
    implements _$RecurringModelCopyWith<$Res> {
  __$RecurringModelCopyWithImpl(this._self, this._then);

  final _RecurringModel _self;
  final $Res Function(_RecurringModel) _then;

/// Create a copy of RecurringModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? amount = null,Object? category = null,Object? type = null,Object? currency = null,Object? frequency = null,Object? startDate = null,Object? endDate = freezed,Object? nextDueDate = freezed,}) {
  return _then(_RecurringModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransactionCategory,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as Frequency,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
