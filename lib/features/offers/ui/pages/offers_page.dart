import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/constants/app_constant.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        if (cubit.state.currentPage == AppMenusTitle.offers) {
          return Center(
            child: ElevatedButton(
              onPressed: () =>
                  cubit.pushPage(AppMenusTitle.selectedOfferDetail),
              child: const Text("Souscrire"),
            ),
          );
        } else if (cubit.state.currentPage ==
            AppMenusTitle.selectedOfferDetail) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Scaffold()));
              },
              child: const Text("Confirmer souscription"),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
