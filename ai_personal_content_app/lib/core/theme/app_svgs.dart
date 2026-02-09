import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture robotFaceSvg() {
  return SvgPicture.asset("assets/images/svgs/robot.svg");
}

SvgPicture googleLogoSvg() {
  return SvgPicture.asset(
    "assets/images/svgs/google-icon-logo.svg",
    height: 20.w,
    width: 20.w,
  );
}

SvgPicture githubLogoSvg() {
  return SvgPicture.asset(
    "assets/images/svgs/github_logo.svg",
    height: 20.w,
    width: 20.w,
  );
}

SvgPicture databaseIconSvg({Color? color}) {
  return SvgPicture.asset(
    "assets/images/svgs/database_icon.svg",
    height: 20.w,
    width: 20.w,
    colorFilter: color != null
        ? ColorFilter.mode(color, BlendMode.srcIn)
        : null,
  );
}

SvgPicture appIconSvg() {
  return SvgPicture.asset("assets/images/svgs/app-icon.svg");
}
