import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_order_id_model.g.dart';

part 'payment_order_id_model.freezed.dart';

@freezed
abstract class PaymentOrderIdModel with _$PaymentOrderIdModel {
  factory PaymentOrderIdModel({
    required int amount,
    required int createdAt,
    required String currency,
    required String orderId,
    required Map<String, String> notes,
    required String receipt,
    required String status,
  }) = _PaymentOrderIdModel;

  factory PaymentOrderIdModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderIdModelFromJson(json);
}
