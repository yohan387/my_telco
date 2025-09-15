import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/offer/data/entities/offer.dart';
import 'package:my_telco/features/offer/data/repo/offers_repo.dart';

part 'subscribe_to_offer_state.dart';

class SubscribeToOfferCubit extends Cubit<SubscribeToOfferState> {
  final IOfferRepo _offerRepo;
  SubscribeToOfferCubit(this._offerRepo)
    : super(const SubscribeToOfferInitial());

  Future<void> call(Offer offer) async {
    emit(const SubscribeToOfferLoading());

    final result = await _offerRepo.subscribeToOffer(offer);

    result.fold(
      (failure) => emit(SubscribeToOfferFailure(failure)),
      (_) => emit(const SubscribeToOfferSuccess()),
    );
  }
}
