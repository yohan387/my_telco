import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/offer/data/entities/offer.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/states/subscribe_to_offer/subscribe_to_offer_cubit.dart';
import 'package:my_telco/features/offer/ui/widgets/confirmation.dart';
import 'package:my_telco/features/offer/ui/widgets/offer_card.dart';
import 'package:my_telco/features/offer/ui/widgets/offer_data_widget.dart';

class SelectedOfferRecap extends StatelessWidget {
  const SelectedOfferRecap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscribeToOfferCubit, SubscribeToOfferState>(
      listener: (context, state) {
        if (state is SubscribeToOfferSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmationWidget()),
          );
        }
        if (state is SubscribeToOfferFailure) {}
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.xl,
          right: AppPadding.xl,
          top: AppPadding.xl,
        ),
        child: BlocBuilder<GetOffersCubit, GetOffersState>(
          builder: (context, state) {
            if (state is GetOffersSuccess && state.selectedOffer != null) {
              final selectedOffer = state.selectedOffer!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Récap de la transaction",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 66, 65, 65),
                    ),
                  ),
                  AppEmptySpace.verticalXl,
                  _buildOfferDescription(selectedOffer),
                  AppEmptySpace.verticalXl,
                  _buildPaymentRecap(selectedOffer),
                  AppEmptySpace.verticalXl,
                  BlocBuilder<SubscribeToOfferCubit, SubscribeToOfferState>(
                    builder: (context, state) {
                      return AppButton(
                        label: "Souscrire",
                        onPressed: () {
                          context.read<SubscribeToOfferCubit>().call(
                            selectedOffer,
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  OfferCard _buildOfferDescription(Offer offer) {
    return OfferCard(child: OfferDataWidget(offer: offer));
  }

  OfferCard _buildPaymentRecap(Offer offer) {
    return OfferCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Méthode de paiement",
            style: AppTextStyles.bodyTextSecondary,
          ),
          AppEmptySpace.verticalLarge,
          Row(
            children: [
              const AppIcon(imgPath: AppAssetsSvgIcons.offer),
              AppEmptySpace.horizontalSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Balance", style: AppTextStyles.bodyTextPrimary),
                  Text(
                    offer.price.formatAsAmount(),
                    style: AppTextStyles.bodyText3,
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: AppColors.grey, height: 12),
          const Text(
            "Résumé de paiement",
            style: AppTextStyles.bodyTextSecondary,
          ),
          AppEmptySpace.verticalLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Montant", style: AppTextStyles.bodyTextPrimary),
              Text(
                offer.price.formatAsAmount(),
                style: AppTextStyles.bodyText3,
              ),
            ],
          ),
          AppEmptySpace.verticalNormal,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ),
              Text(
                offer.price.formatAsAmount(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
