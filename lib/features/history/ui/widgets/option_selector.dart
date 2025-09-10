import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/history/domain/entities/app_option_chips_item.dart';

class AppOptionsChipsSelector<T> extends StatelessWidget {
  final List<AppOptionChipsItem<T>> items;
  final T? selected;
  final ValueChanged<T> onChanged;
  final double spacing;
  final WrapAlignment wrapAlignment;
  final EdgeInsetsGeometry chipPadding;

  const AppOptionsChipsSelector({
    super.key,
    required this.items,
    required this.selected,
    required this.onChanged,
    this.spacing = 12,
    this.wrapAlignment = WrapAlignment.start,
    this.chipPadding = const EdgeInsets.symmetric(horizontal: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: wrapAlignment,
      children: items.map((opt) {
        final isSelected = opt.value == selected;

        return ChoiceChip(
          avatar: opt.icon,
          showCheckmark: false,
          label: Text(opt.label),
          selected: isSelected,
          padding: chipPadding,
          selectedColor: AppColors.orangeGradiant2,
          backgroundColor: AppColors.white,
          labelStyle: TextStyle(
            color: isSelected ? AppColors.orange : AppColors.black,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: const BorderSide(color: AppColors.grey),
          onSelected: (_) => onChanged(opt.value),
        );
      }).toList(),
    );
  }
}
