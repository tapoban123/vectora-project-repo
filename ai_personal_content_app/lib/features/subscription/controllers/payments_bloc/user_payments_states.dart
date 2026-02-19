import 'package:ai_personal_content_app/features/subscription/models/payment_order_id_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payments_states.freezed.dart';

@freezed
abstract class UserPaymentsStates with _$UserPaymentsStates {
  factory UserPaymentsStates.initial() = _Initial;

  factory UserPaymentsStates.loadingUserPayments() = _LoadingUserPayments;

  factory UserPaymentsStates.success() = _Success;

  factory UserPaymentsStates.generatingOrderId() = _GeneratingOrderId;

  factory UserPaymentsStates.orderIdGenerated({
    required PaymentOrderIdModel orderIdResponse,
  }) = _GeneratedOrderId;

  factory UserPaymentsStates.allUserPayments() = _AllUserPayments;
}
