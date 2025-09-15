const String _navBarBase = "assets/nav_bar";
const String _historyBase = "assets/history";
const String _offerBase = "assets/forfaits";
const String _common = "assets/common";
const String _dashboard = "assets/dashboard";
const String _pngFiles = "assets/png_files";

abstract final class AppAssetsSvgIcons {
  static const String homeOrange = '$_navBarBase/accueil_orange.svg';
  static const String offer = '$_navBarBase/forfait.svg';
  static const String offerOrange = '$_navBarBase/forfait_orange.svg';
  static const String pass = '$_navBarBase/pass.svg';
  static const String passOrange = '$_navBarBase/pass_orange.svg';
  static const String history = '$_navBarBase/historique.svg';
  static const String historyOrange = '$_navBarBase/historique_orange.svg';

  static const String call = '$_historyBase/appel.svg';
  static const String callOrange = '$_historyBase/appel_orange.svg';
  static const String sms = '$_historyBase/sms.svg';
  static const String smsOrange = '$_historyBase/sms_orange.svg';
  static const String wifi = '$_historyBase/wifi.svg';
  static const String wifiOrange = '$_historyBase/wifi_orange.svg';

  static const String callTo = '$_offerBase/appel_vers.svg';
  static const String calendar = '$_offerBase/calendrier.svg';
  static const String expiration = '$_offerBase/expiration.svg';
  static const String doubleArrow = '$_offerBase/pass.svg';
  static const String all = '$_offerBase/tous.svg';

  static const String puce = '$_dashboard/puce.svg';
  static const String balance = '$_dashboard/solde.svg';
}

abstract final class AppAssetsPngIcons {
  static const String home = '$_pngFiles/accueil.png';
  static const String success = '$_pngFiles/success.png';
  static const String warning = '$_pngFiles/warning.png';
  static const String emptyContent = '$_pngFiles/empty_content.png';
  static const String profile = '$_pngFiles/profile.png';
  static const String logo = '$_pngFiles/logo.png';
}
