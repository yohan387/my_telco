import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:my_telco/features/offer/domain/repo/offer_repo.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  final IOfferRepo _offerRepo;
  GetOffersCubit(this._offerRepo) : super(const GetOffersInitial());

  Future<void> call() async {
    emit(const GetOffersLoading());

    final result = await _offerRepo.getOffers();

    result.fold(
      (failure) => emit(GetOffersFailure(failure)),
      (records) => emit(GetOffersSuccess(records)),
    );
  }

  void selectOffer(Offer offer) {
    final currentState = state;
    if (currentState is GetOffersSuccess) {
      emit(GetOffersSuccess(
        currentState.records,
        selectedOffer: offer,
      ));
    }
  }
}
