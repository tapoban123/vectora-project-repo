import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onLeadingTap;

  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontVariations: [FontVariation.weight(600)],
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed:
            onLeadingTap ??
            () {
              context.pop();
            },
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        icon: leading ?? Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      actionsPadding: EdgeInsets.all(12.w),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
