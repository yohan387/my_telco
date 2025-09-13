import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_telco/features/dashboard/domain/entities/customer.dart';

abstract interface class ILocalDashboardDataService {
  Future<Customer> getCustormerProfile();
}

class LocalDashboardDataService implements ILocalDashboardDataService {
  @override
  Future<Customer> getCustormerProfile() async {
    await Future.delayed(const Duration(seconds: 1));

    final String response = await rootBundle.loadString(
      'assets/mock_data/dashboard.json',
    );

    final data = jsonDecode(response);

    return Customer(
      id: data['id'],
      name: data['nom'],
      phoneNumber: data['telephone'],
      balance: (data['solde'] as num).toDouble(),
      balanceValidity: DateTime.parse(data['date_expiration_solde'] as String),
      data:
          (data['donnees'] as List)
              .map(
                (e) => CustomerData(
                  type: e['type'] as String,
                  value: e['valeur'] as String,
                  dateValidity: DateTime.parse(e['date_expiration'] as String),
                ),
              )
              .toList(),
    );
  }
}
