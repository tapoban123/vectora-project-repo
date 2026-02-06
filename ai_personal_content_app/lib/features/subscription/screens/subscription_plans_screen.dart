import 'package:ai_personal_content_app/core/common/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Plans"),
    );
  }
}
