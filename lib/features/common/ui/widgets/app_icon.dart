import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_telco/core/constants/enums.dart';

class AppIcon extends StatelessWidget {
  final String imgPath;
  final double size;
  final Color? color;
  final AppIconType type;
  final double padding;

  const AppIcon({
    super.key,
    required this.imgPath,
    this.size = 22,
    this.color,
    this.type = AppIconType.svg,
    this.padding = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          type == AppIconType.svg
              ? SvgPicture.asset(imgPath, width: size, height: size)
              : Image.asset(imgPath, width: size, height: size),
    );
  }
}
