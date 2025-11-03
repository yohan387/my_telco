import 'package:equatable/equatable.dart';

class CustomerData extends Equatable {
  final String type;
  final String value;
  final DateTime dateValidity;

  const CustomerData({
    required this.type,
    required this.value,
    required this.dateValidity,
  });

  @override
  List<Object?> get props => [type, value, dateValidity];
}

class Customer extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final double balance;
  final DateTime balanceValidity;
  final List<CustomerData> data;

  const Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.balance,
    required this.balanceValidity,
    required this.data,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phoneNumber,
    balanceValidity,
    balance,
    data,
  ];
}
