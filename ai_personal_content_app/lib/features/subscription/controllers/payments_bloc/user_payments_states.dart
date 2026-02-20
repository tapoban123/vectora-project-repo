import 'package:ai_personal_content_app/core/api/api_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payments_states.freezed.dart';

@freezed
abstract class UserPaymentsStates with _$UserPaymentsStates {
  factory UserPaymentsStates.initial() = _Initial;

  factory UserPaymentsStates.loadingUserPayments() = _LoadingUserPayments;

  factory UserPaymentsStates.paymentStarted() = _PaymentStarted;

  factory UserPaymentsStates.paymentInitiated() = _PaymentInitiated;

  factory UserPaymentsStates.allUserPayments() = _AllUserPayments;

  factory UserPaymentsStates.error({required ApiException exception}) = _Error;
}
