import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'user_payments_events.freezed.dart';

@freezed
abstract class UserPaymentsEvents with _$UserPaymentsEvents {
  factory UserPaymentsEvents.createPayment() = CreatePayment;

  factory UserPaymentsEvents.startPayment({required Razorpay razorpay}) = StartPayment;

  factory UserPaymentsEvents.fetchAllUserPayments() = FetchAllUserPayments;

  factory UserPaymentsEvents.resetState() = ResetPaymentsBloc;
}
