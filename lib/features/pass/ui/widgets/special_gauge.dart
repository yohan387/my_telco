import 'package:flutter/material.dart';

/// Horizontal gauge with title left and remaining time right.
/// - [title] : main label shown at top-left
/// - [remainingText] : string shown at top-right (e.g. "11 days")
/// - [value] : current progress value (>= 0)
/// - [maxValue] : maximum value for the gauge (> 0)
/// - [height] : bar height
/// - [foregroundColor] / [backgroundColor] : bar colors
/// - [animate] : animate progress changes
class HorizontalGauge extends StatelessWidget {
  final String title;
  final String remainingText;
  final double value;
  final double maxValue;
  final double height;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool animate;
  final Duration animationDuration;
  final TextStyle? titleStyle;
  final TextStyle? remainingStyle;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;

  const HorizontalGauge({
    super.key,
    required this.title,
    required this.remainingText,
    required this.value,
    required this.maxValue,
    this.height = 8.0,
    this.foregroundColor = Colors.orange,
    this.backgroundColor = const Color(0xFFEFEFEF),
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.titleStyle,
    this.remainingStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  }) : assert(maxValue > 0);

  double get _clampedRatio {
    final ratio = (value / maxValue);
    if (ratio.isNaN) return 0.0;
    if (ratio.isInfinite) return 1.0;
    return ratio.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTxtStyle =
        titleStyle ??
        theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);
    final remainingTxtStyle =
        remainingStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        );

    final ratio = _clampedRatio;

    Widget bar = _GaugeBar(
      ratio: ratio,
      height: height,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      animate: animate,
      animationDuration: animationDuration,
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // top row: title left, remaining right
          Row(
            children: [
              Expanded(child: Text(title, style: titleTxtStyle)),
              Text(remainingText, style: remainingTxtStyle),
            ],
          ),
          const SizedBox(height: 8),
          // gauge + optional percentage at the end
          Row(
            children: [
              // gauge expands
              Expanded(child: bar),
              const SizedBox(width: 12),
              // percentage text
              Text(
                '${(ratio * 100).round()}%',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
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
    final bar = LayoutBuilder(
      builder: (context, constraints) {
        final fullWidth =
            constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
        final filledWidth = fullWidth * ratio;

        // background container with rounded corners
        return Stack(
          children: [
            // background
            Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
              ),
            ),
            // foreground (filled part)
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

    if (!animate) return bar;

    // animate width change using TweenAnimationBuilder and fractional width
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: ratio),
      duration: animationDuration,
      builder: (context, animatedRatio, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final fullWidth =
                constraints.maxWidth.isFinite ? constraints.maxWidth : 0.0;
            final filledWidth = fullWidth * animatedRatio;

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
      },
    );
  }
}
