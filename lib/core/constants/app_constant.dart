import 'package:flutter/material.dart';

enum AppIconType { svg, png }

enum OfferType { data, voice, mixed }

enum ConsumptionType { call, sms, data }

class AppMenusTitle {
  static const String home = "Accueil";
  static const String offers = "Forfaits disponibles";
  static const String subscriptions = "Mes pass";
  static const String history = "Historique";

  static const String selectedOfferDetail = "Forfait disponible";
  static const String selectedOfferConfirmation = "Confirmation";
  static const String cancelPass = "Résilier pass";
}

class AppColors {
  static const Color orange = Color.fromARGB(255, 229, 110, 30);
  static const Color orangeGradiant1 = Color.fromARGB(255, 235, 140, 77);
  static const Color orangeGradiant2 = Color.fromARGB(255, 255, 224, 167);

  static const Color scaffoldBackgroundColor =
      Color.fromARGB(255, 247, 247, 247);

  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black54;
  static const Color white = Colors.white;

  static const Color error = Colors.redAccent;
}

const String _navBarIconsPath = "lib/core/assets/icons/nav_bar";

class AppSvgIconsData {
  static const String homeActive = '$_navBarIconsPath/accueil_actif.svg';

  static const String offerActive = '$_navBarIconsPath/forfait_actif.svg';
  static const String offerInActive = '$_navBarIconsPath/forfait_inactif.svg';

  static const String subscriptionActif =
      '$_navBarIconsPath/subscription_actif.svg';
  static const String subscriptionInActive =
      '$_navBarIconsPath/subscription_inactif.svg';

  static const String historyActif = '$_navBarIconsPath/historique_actif.svg';
  static const String historyInActive =
      '$_navBarIconsPath/historique_inactif.svg';
}

class AppPngIconsData {
  static const String _navBarIconsPath = "lib/core/assets/icons/nav_bar";
  static const String homeInActive = '$_navBarIconsPath/accueil_inactif.png';
}
