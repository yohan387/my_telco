import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.backgroundColor = AppColors.orange,
    this.borderColor = AppColors.transparent,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isEnabled ? backgroundColor : AppColors.grey.withOpacity(0.1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          side: BorderSide(color: borderColor),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        minimumSize: const Size(double.maxFinite, 34),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(2),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isEnabled ? textColor : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
