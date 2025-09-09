import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_telco/core/constants/colors.dart';
import 'package:my_telco/core/constants/enums.dart';

class AppSvgIcon extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Color? color;
  final AppIconType type;
  final bool withBackground;

  const AppSvgIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.color,
    this.type = AppIconType.svg,
    this.withBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: withBackground
          ? BoxDecoration(
              color: AppColors.orangeGradiant2,
              borderRadius: BorderRadius.circular(12))
          : const BoxDecoration(),
      child: type == AppIconType.svg
          ? SvgPicture.asset(
              icon,
              width: width ?? 24,
              height: height ?? 24,
            )
          : Image.asset(
              icon,
              width: width ?? 24,
              height: height ?? 24,
            ),
    );
  }
}
