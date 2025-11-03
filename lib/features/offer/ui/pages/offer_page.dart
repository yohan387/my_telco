import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/features/offer/ui/widgets/offers_list.dart';
import 'package:my_telco/features/offer/ui/widgets/selected_offer_recap.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        if (state.currentPage == AppMenus.offers) {
          return const OffersList();
        }

        if (state.currentPage == AppMenus.selectedOfferDetail) {
          return const SelectedOfferRecap();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
