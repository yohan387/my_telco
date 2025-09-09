import 'package:my_telco/features/dashboard/domain/entities/customer.dart';

abstract interface class ILocalDataService {
  Future<Customer> getCustormerProfile();
}

class LocalDataService implements ILocalDataService {
  @override
  Future<Customer> getCustormerProfile() async {
    Future.delayed(const Duration(seconds: 1));
    return const Customer(
      id: '1',
      name: 'John Doe',
      phoneNumber: '1234567890',
      balance: 100,
      internetBalance: 100,
      voiceMinutes: 100,
      smsCount: 100,
    );
  }
}
