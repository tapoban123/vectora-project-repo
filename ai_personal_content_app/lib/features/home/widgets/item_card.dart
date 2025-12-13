import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.push(RouteNames.viewItemOptions);
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/seed/picsum/200/300",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        Text(
          "Project Plan.pdf",
          style: TextStyle(
            fontVariations: [FontVariation.weight(600)],
            fontSize: 16.sp,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "PDF",
          style: TextStyle(
            fontVariations: [FontVariation.weight(400)],
            fontSize: 14.sp,
            color: AppColors.inactiveColor,
          ),
        ),
      ],
    );
  }
}
