import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isEnabled ? AppColors.orange : AppColors.gray.withOpacity(0.1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        minimumSize: const Size(double.maxFinite, 34),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isEnabled ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
