import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:ai_personal_content_app/core/constants/env_values.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/theme/app_svgs.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/subscription/controllers/payments_bloc/user_payments_bloc.dart';
import 'package:ai_personal_content_app/features/subscription/controllers/payments_bloc/user_payments_events.dart';
import 'package:ai_personal_content_app/features/subscription/controllers/payments_bloc/user_payments_states.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final Razorpay _razorpay;
  final List<String> _benefits = [
    "Everything is free",
    "2,000 monthly credits",
    "No ads. Ever",
  ];

  @override
  void initState() {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log(response.data.toString());
    log(response.orderId.toString());
    log(response.paymentId.toString());
    log(response.signature.toString());

    context.go(RouteNames.home);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log(response.error.toString(), name: "RAZORPAY ERROR");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Checkout"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "REVIEW SUBSCRIPTION",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontVariations: [FontVariation.weight(600)],
                        color: AppColors.inactiveColor,
                      ),
                    ),
                    16.verticalSpace,
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 7.h,
                            horizontal: 16.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.r),
                              bottomLeft: Radius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "RECOMMENDED",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontVariations: [FontVariation.weight(800)],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(25.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.blueColor.withValues(alpha: 0.2),
                                AppColors.blueColor.withValues(alpha: 0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: AppColors.blueColor,
                              width: 2.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Premium",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontVariations: [
                                        FontVariation.weight(700),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.workspace_premium_outlined,
                                    color: AppColors.blueColor,
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "₹ 149",
                                  style: TextStyle(
                                    fontFamily: APP_FONT_FAMILY,
                                    fontSize: 30.sp,
                                    fontVariations: [FontVariation.weight(800)],
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " /month",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontVariations: [
                                          FontVariation.weight(500),
                                        ],
                                        color: AppColors.inactiveColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Monthly billing",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontVariations: [FontVariation.weight(500)],
                                  color: AppColors.blueColor,
                                ),
                              ),
                              24.verticalSpace,
                              Divider(color: Colors.white12),
                              24.verticalSpace,
                              Row(
                                spacing: 14.w,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  databaseIconSvg(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2,000 credits",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontVariations: [
                                            FontVariation.weight(600),
                                          ],
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Refills every month",
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontVariations: [
                                            FontVariation.weight(400),
                                          ],
                                          color: AppColors.inactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    Text(
                      "INCLUDED BENEFITS",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontVariations: [FontVariation.weight(600)],
                        color: AppColors.inactiveColor,
                      ),
                    ),
                    18.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 18.h,
                      children: List.generate(
                        _benefits.length,
                        (index) => Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 16.w,
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                color: AppColors.deepBlueColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: AppColors.blueColor,
                                size: 18.w,
                              ),
                            ),
                            Text(
                              _benefits[index],
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontVariations: [FontVariation.weight(400)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    44.verticalSpace,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.greyColor,
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BILLING SUMMARY",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontVariations: [FontVariation.weight(600)],
                              color: AppColors.inactiveColor,
                            ),
                          ),
                          16.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Plan Price",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontVariations: [FontVariation.weight(400)],
                                  color: AppColors.inactiveColor,
                                ),
                              ),
                              Text(
                                "₹ 149.00",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontVariations: [FontVariation.weight(500)],
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          12.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontVariations: [FontVariation.weight(400)],
                                  color: AppColors.inactiveColor,
                                ),
                              ),
                              Text(
                                "₹ 0.00",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontVariations: [FontVariation.weight(500)],
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          12.verticalSpace,
                          Divider(color: Colors.white12),
                          14.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Payable",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontVariations: [FontVariation.weight(600)],
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "₹ 149.00",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontVariations: [FontVariation.weight(700)],
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    14.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.deepDarkColor,
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              children: [
                Text(
                  "Auto-renews monthly. Cancel anytime.",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontVariations: [FontVariation.weight(400)],
                    color: AppColors.lightGreyColor,
                  ),
                ),
                16.verticalSpace,
                ElevatedButton(
                  onPressed: () async {
                    context.read<UserPaymentsBloc>().add(
                      StartPayment(razorpay: _razorpay),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor,
                    minimumSize: Size(double.infinity, 56.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: BlocBuilder<UserPaymentsBloc, UserPaymentsStates>(
                    builder: (context, state) => state.maybeWhen(
                      paymentInitiated: () =>
                          appCircularProgressIndicator(color: Colors.white),
                      orElse: () => Text(
                        "Proceed to pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontVariations: [FontVariation.weight(600)],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
