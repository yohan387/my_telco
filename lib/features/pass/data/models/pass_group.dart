import 'package:equatable/equatable.dart';
import 'package:my_telco/features/common/models/pass.dart';

class PassGroup extends Equatable {
  final List<Pass> valid;
  final List<Pass> expired;

  const PassGroup({this.valid = const [], this.expired = const []});

  String get validPassCountLabel => valid.length.toString().padLeft(2, '0');
  String get expiredPassCountLabel => expired.length.toString().padLeft(2, '0');

  @override
  List<Object?> get props => [valid, expired];
}
