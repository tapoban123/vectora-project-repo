import 'package:flutter_dotenv/flutter_dotenv.dart';

final String GOOGLE_SERVICE_CLIENT_ID = dotenv.env["GOOGLE_SERVICE_CLIENT_ID"]!;
final String API_BASE_URL = dotenv.env["API_BASE_URL"]!;
final String AD_UNIT_ID_PROD = dotenv.env["REWARDED_AD_UNIT_PROD_ID"]!;
final String AD_UNIT_ID_DEV = dotenv.env["REWARDED_AD_UNIT_DEV_ID"]!;
final String RAZORPAY_API_TEST_KEY = dotenv.env["RAZORPAY_API_KEY_DEV"]!;
final String RAZORPAY_API_TEST_SECRET = dotenv.env["RAZORPAY_API_SECRET_DEV"]!;
