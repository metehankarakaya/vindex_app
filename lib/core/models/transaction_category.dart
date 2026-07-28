import 'package:json_annotation/json_annotation.dart';

enum TransactionCategory {
  @JsonValue('MARKET')
  market,
  @JsonValue('RESTAURANT')
  restaurant,
  @JsonValue('TRANSPORTATION')
  transportation,
  @JsonValue('SUBSCRIPTIONS')
  subscriptions,
  @JsonValue('BILLS')
  bills,
  @JsonValue('HEALTH')
  health,
  @JsonValue('ENTERTAINMENT')
  entertainment,
  @JsonValue('SALARY')
  salary,
  @JsonValue('OTHER')
  other,
}
