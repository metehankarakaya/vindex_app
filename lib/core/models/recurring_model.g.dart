// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecurringModel _$RecurringModelFromJson(Map<String, dynamic> json) =>
    _RecurringModel(
      id: json['id'] as String?,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: $enumDecode(_$TransactionCategoryEnumMap, json['category']),
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      currency: json['currency'] as String,
      frequency: $enumDecode(_$FrequencyEnumMap, json['frequency']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      nextDueDate: json['nextDueDate'] == null
          ? null
          : DateTime.parse(json['nextDueDate'] as String),
    );

Map<String, dynamic> _$RecurringModelToJson(_RecurringModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'category': _$TransactionCategoryEnumMap[instance.category]!,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'currency': instance.currency,
      'frequency': _$FrequencyEnumMap[instance.frequency]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'nextDueDate': instance.nextDueDate?.toIso8601String(),
    };

const _$TransactionCategoryEnumMap = {
  TransactionCategory.market: 'MARKET',
  TransactionCategory.restaurant: 'RESTAURANT',
  TransactionCategory.transportation: 'TRANSPORTATION',
  TransactionCategory.subscriptions: 'SUBSCRIPTIONS',
  TransactionCategory.bills: 'BILLS',
  TransactionCategory.health: 'HEALTH',
  TransactionCategory.entertainment: 'ENTERTAINMENT',
  TransactionCategory.salary: 'SALARY',
  TransactionCategory.other: 'OTHER',
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'INCOME',
  TransactionType.expense: 'EXPENSE',
};

const _$FrequencyEnumMap = {
  Frequency.daily: 'DAILY',
  Frequency.weekly: 'WEEKLY',
  Frequency.monthly: 'MONTHLY',
  Frequency.yearly: 'YEARLY',
};
