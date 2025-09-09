import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final double balance;
  final double internetBalance; // in MB
  final int voiceMinutes;
  final int smsCount;

  const Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.balance,
    required this.internetBalance,
    required this.voiceMinutes,
    required this.smsCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        balance,
        internetBalance,
        voiceMinutes,
        smsCount,
      ];
}
