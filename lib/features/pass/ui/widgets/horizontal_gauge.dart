import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';

class HorizontalGauge extends StatelessWidget {
  final String title;
  final String remainingText;
  final int value;
  final int maxValue;
  final double height;
  final bool animate;
  final Duration animationDuration;
  final TextStyle? titleStyle;
  final TextStyle? remainingStyle;

  const HorizontalGauge({
    super.key,
    required this.title,
    required this.remainingText,
    required this.value,
    required this.maxValue,
    this.height = 2,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.titleStyle,
    this.remainingStyle,
  });

  double get _clampedRatio {
    final ratio = (value / maxValue);
    if (ratio.isNegative) return 0.0;
    if (ratio.isNaN) return 0.0;
    if (ratio.isInfinite) return 1.0;
    return ratio.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTitle(),

        _GaugeBar(
          ratio: _clampedRatio,
          height: height,
          foregroundColor: AppColors.orange,
          backgroundColor: AppColors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          animate: animate,
          animationDuration: animationDuration,
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyles.bodyTextPrimary)),
        Text(remainingText, style: AppTextStyles.bodyTextPrimary),
      ],
    );
  }
}

class _GaugeBar extends StatelessWidget {
  final double ratio;
  final double height;
  final Color foregroundColor;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final bool animate;
  final Duration animationDuration;

  const _GaugeBar({
    required this.ratio,
    required this.height,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.animate,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return animate ? _buildAnimatedBar(ratio) : _buildSimpleBar(ratio);
  }

  TweenAnimationBuilder<double> _buildAnimatedBar(double ratio) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: ratio == 0.0 ? 0 : 1 - (1 - ratio)),
      duration: animationDuration,
      builder: (context, animatedRatio, child) {
        return _buildSimpleBar(animatedRatio);
      },
    );
  }

  LayoutBuilder _buildSimpleBar(double ratio) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fullWidth =
            constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
        final filledWidth = fullWidth * ratio;

        return Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
              ),
            ),
            ClipRRect(
              borderRadius: borderRadius,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: filledWidth,
                  height: height,
                  color: foregroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
