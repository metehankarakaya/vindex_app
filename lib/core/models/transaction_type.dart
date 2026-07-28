import 'package:json_annotation/json_annotation.dart';

enum TransactionType {
  @JsonValue('INCOME')
  income,
  @JsonValue('EXPENSE')
  expense,
}
