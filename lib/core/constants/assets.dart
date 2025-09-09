const String _navBarBase = "assets/nav_bar";

abstract final class AppAssetsSvgIcons {
  static const String homeActive = '$_navBarBase/accueil_actif.svg';

  static const String offerActive = '$_navBarBase/forfait_actif.svg';
  static const String offerInActive = '$_navBarBase/forfait_inactif.svg';

  static const String subscriptionActif = '$_navBarBase/subscription_actif.svg';
  static const String subscriptionInActive =
      '$_navBarBase/subscription_inactif.svg';

  static const String historyActif = '$_navBarBase/historique_actif.svg';
  static const String historyInActive = '$_navBarBase/historique_inactif.svg';
}

abstract final class AppAssetsPngIcons {
  static const String homeInActive = '$_navBarBase/accueil_inactif.png';
}
