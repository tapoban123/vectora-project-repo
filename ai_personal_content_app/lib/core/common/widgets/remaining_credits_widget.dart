import 'package:ai_personal_content_app/core/common/cubits/credits_and_quotas_cubit.dart';
import 'package:ai_personal_content_app/core/common/models/user_credits_and_quotas_model.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemainingCreditsWidget extends StatelessWidget {
  const RemainingCreditsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showCreditsDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.deepBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
        minimumSize: Size.zero,
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.stars, color: AppColors.blueColor),
          BlocBuilder<CreditsAndQuotasCubit, UserCreditsAndQuotasModel?>(
            builder: (context, state) => Text(
              "${state?.remainingCredits ?? "-"}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontVariations: [FontVariation.weight(500)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
