import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/ui/widgets/loading_card.dart';

class AppPlaceholderList extends StatelessWidget {
  final int itemCount;
  final double height;
  const AppPlaceholderList({super.key, this.itemCount = 3, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.xl),
          child: LoadingCard(width: double.infinity, height: height),
        );
      },
    );
  }
}
