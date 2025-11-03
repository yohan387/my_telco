import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
    final Widget iconWidget;

    switch (type) {
      case AppIconType.svg:
        iconWidget = VectorGraphic(
          loader: AssetBytesLoader(imgPath),

          width: size,
          height: size,
        );
        break;
      case AppIconType.png:
        iconWidget = Image.asset(
          imgPath,
          width: size,
          height: size,
          color: color,
          colorBlendMode: color != null ? BlendMode.srcIn : BlendMode.dst,
        );
        break;
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(color: color, child: iconWidget),
      ),
    );
  }
}
