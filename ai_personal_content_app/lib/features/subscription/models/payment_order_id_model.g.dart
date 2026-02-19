// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentOrderIdModel _$PaymentOrderIdModelFromJson(Map<String, dynamic> json) =>
    _PaymentOrderIdModel(
      amount: (json['amount'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      currency: json['currency'] as String,
      orderId: json['orderId'] as String,
      notes: Map<String, String>.from(json['notes'] as Map),
      receipt: json['receipt'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PaymentOrderIdModelToJson(
  _PaymentOrderIdModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'createdAt': instance.createdAt,
  'currency': instance.currency,
  'orderId': instance.orderId,
  'notes': instance.notes,
  'receipt': instance.receipt,
  'status': instance.status,
};
