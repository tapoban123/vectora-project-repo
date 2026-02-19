import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payments_events.freezed.dart';

@freezed
abstract class UserPaymentsEvents with _$UserPaymentsEvents {
  factory UserPaymentsEvents.createPayment() = CreatePayment;

  factory UserPaymentsEvents.generateOrderId() = GenerateOrderId;

  factory UserPaymentsEvents.fetchAllUserPayments() = FetchAllUserPayments;

  factory UserPaymentsEvents.resetState() = ResetPaymentsBloc;
}
