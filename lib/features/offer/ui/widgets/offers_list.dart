import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/widgets/offer_item.dart';

class OffersList extends StatefulWidget {
  const OffersList({super.key});

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  late final GetOffersCubit _getOffersCubit;

  @override
  void initState() {
    super.initState();

    _getOffersCubit = context.read<GetOffersCubit>();
    _getOffersCubit();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getOffersCubit(),
      child: BlocConsumer<GetOffersCubit, GetOffersState>(
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.xl),
                  child: OfferItem(offer: state.records[index]),
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
