import 'package:flutter/material.dart';

class SelectedOfferRecap extends StatelessWidget {
  const SelectedOfferRecap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Scaffold()));
        },
        child: const Text("Confirmer souscription"),
      ),
    );
  }
}
