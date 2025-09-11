part of 'cancel_pass_cubit.dart';

sealed class CancelPassState extends Equatable {
  const CancelPassState();

  @override
  List<Object> get props => [];
}

final class CancelPassInitial extends CancelPassState {
  const CancelPassInitial();
}

final class CancelPassLoading extends CancelPassState {
  const CancelPassLoading();
}

final class CancelPassSuccess extends CancelPassState {
  const CancelPassSuccess();
}

final class CancelPassFailure extends CancelPassState {
  final Failure failure;
  const CancelPassFailure(this.failure);

  @override
  List<Object> get props => [];
}
