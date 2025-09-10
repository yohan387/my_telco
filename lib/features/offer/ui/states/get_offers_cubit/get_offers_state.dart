part of 'get_offers_cubit.dart';

sealed class GetOffersState extends Equatable {
  const GetOffersState();

  @override
  List<Object?> get props => [];
}

final class GetOffersInitial extends GetOffersState {
  const GetOffersInitial();
}

final class GetOffersLoading extends GetOffersState {
  const GetOffersLoading();
}

class GetOffersSuccess extends GetOffersState {
  final List<Offer> records;
  final Offer? selectedOffer;

  const GetOffersSuccess(this.records, {this.selectedOffer});

  @override
  List<Object?> get props => [records, selectedOffer];
}

final class GetOffersFailure extends GetOffersState {
  final Failure failure;
  const GetOffersFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
