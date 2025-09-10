import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/app_button.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/widgets/offer_card.dart';
import 'package:my_telco/features/offer/ui/widgets/offer_data_widget.dart';

class OffersList extends StatefulWidget {
  const OffersList({super.key});

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  late final GetOffersCubit _offersCubit;
  late final AppPathCubit _appPathCubit;

  @override
  void initState() {
    super.initState();

    _offersCubit = context.read<GetOffersCubit>();
    _appPathCubit = context.read<AppPathCubit>();
    _offersCubit();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _offersCubit(),
      child: BlocConsumer<GetOffersCubit, GetOffersState>(
        buildWhen: (previous, current) {
          final hasStateTypeChanged =
              previous.runtimeType != current.runtimeType;

          final bothStateAreSuccess =
              previous is GetOffersSuccess && current is GetOffersSuccess;

          final hasRecordsChanged =
              bothStateAreSuccess && previous.records != current.records;

          return hasStateTypeChanged || hasRecordsChanged;
        },
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetOffersLoading) {
            return const CircularProgressIndicator();
          }

          if (state is GetOffersFailure) {
            return const Text("Failure");
          }

          if (state is GetOffersSuccess) {
            return ListView.builder(
              itemCount: state.records.length,
              padding: const EdgeInsets.only(
                left: AppPadding.xl,
                right: AppPadding.xl,
                top: AppPadding.xl,
              ),
              itemBuilder: (context, index) {
                final offer = state.records[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.xl),
                  child: OfferCard(
                    offer: state.records[index],
                    child: Column(
                      children: [
                        OfferDataWidget(offer: offer),
                        AppEmptySpace.verticalXl,
                        AppButton(
                          label: "Souscrire",
                          onPressed: () {
                            _appPathCubit
                                .pushPage(AppMenus.selectedOfferDetail);
                            _offersCubit.selectOffer(offer);
                          },
                          isEnabled: offer.isAvailable,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
