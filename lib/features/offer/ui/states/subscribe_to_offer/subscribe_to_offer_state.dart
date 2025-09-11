part of 'subscribe_to_offer_cubit.dart';

sealed class SubscribeToOfferState extends Equatable {
  const SubscribeToOfferState();

  @override
  List<Object> get props => [];
}

final class SubscribeToOfferInitial extends SubscribeToOfferState {
  const SubscribeToOfferInitial();
}

final class SubscribeToOfferLoading extends SubscribeToOfferState {
  const SubscribeToOfferLoading();
}

final class SubscribeToOfferSuccess extends SubscribeToOfferState {
  const SubscribeToOfferSuccess();
}

final class SubscribeToOfferFailure extends SubscribeToOfferState {
  final Failure failure;
  const SubscribeToOfferFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
