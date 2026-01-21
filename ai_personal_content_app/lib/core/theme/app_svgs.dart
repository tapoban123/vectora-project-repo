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

SvgPicture appIconSvg() {
  return SvgPicture.asset("assets/images/svgs/app-icon.svg");
}
