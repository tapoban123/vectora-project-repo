import 'dart:developer';

import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:ai_personal_content_app/features/subscription/controllers/payments_bloc/user_payments_events.dart';
import 'package:ai_personal_content_app/features/subscription/controllers/payments_bloc/user_payments_states.dart';
import 'package:ai_personal_content_app/features/subscription/services/payment_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPaymentsBloc extends Bloc<UserPaymentsEvents, UserPaymentsStates> {
  final PaymentServices _paymentServices;

  UserPaymentsBloc({required PaymentServices paymentServices})
    : _paymentServices = paymentServices,
      super(UserPaymentsStates.initial()) {
    on<CreatePayment>(_createPayment);
    on<StartPayment>(_startPayment);
    on<FetchAllUserPayments>(_fetchAllUserPayments);
    on<ResetPaymentsBloc>(_resetPaymentsBloc);
  }

  void _createPayment(CreatePayment event, Emitter emit) {}

  void _startPayment(StartPayment event, Emitter emit) async {
    emit(UserPaymentsStates.paymentInitiated());
    final orderIdGenRes = await _paymentServices.generatePaymentOrderId();
    orderIdGenRes.fold(
      (l) {
        log("ERROR TO PAY");
        emit(UserPaymentsStates.error(exception: l));
      },
      (r) {
        final options = {
          'key': RAZORPAY_API_TEST_KEY,
          'amount': 149,
          'currency': 'INR',
          'name': 'Tapoban Ray',
          'order_id': r.orderId,
          'description': 'Premium Subscription',
          'timeout': 300, // in seconds
          'config': {
            'display': {
              'blocks': {
                'banks': {
                  'name': 'Pay via Card, UPI or Netbanking',
                  'instruments': [
                    {'method': 'card'},
                    {'method': 'upi'},
                    {'method': 'netbanking'},
                  ],
                },
              },
              'sequence': ['block.banks'],
              'preferences': {
                'show_default_blocks': false, // Hides wallets, EMI, etc.
              },
            },
          },
          'prefill': {'contact': '<phone>', 'email': '<email>'},
          'theme': {'color': '#101622'},
        };
        event.razorpay.open(options);
        emit(UserPaymentsStates.paymentStarted());
      },
    );
  }

  void _fetchAllUserPayments(FetchAllUserPayments event, Emitter emit) {}

  void _resetPaymentsBloc(ResetPaymentsBloc event, Emitter emit) {}
}
