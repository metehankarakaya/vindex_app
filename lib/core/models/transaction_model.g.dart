// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String?,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      category: $enumDecode(_$TransactionCategoryEnumMap, json['category']),
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      currency: json['currency'] as String,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      recurringId: json['recurringId'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'category': _$TransactionCategoryEnumMap[instance.category]!,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'currency': instance.currency,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'recurringId': instance.recurringId,
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
