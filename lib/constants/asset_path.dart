//Images
const String imageAssetsRoot = "assets/images/";

final String logo = _getImagePath("logo.png");

//Images helper function
String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

//Icons
const String iconAssetsRoot = "assets/icons/";

final String nwLogoIconPath = _getIconPath("nw_logo.svg");
final String dashboardIconPath = _getIconPath("menu_dashbord.svg");
final String transactionsIconPath = _getIconPath("menu_tran.svg");
final String documentsIconPath = _getIconPath("menu_doc.svg");
final String notificationIconPath = _getIconPath("menu_notification.svg");
final String profileIconPath = _getIconPath("menu_profile.svg");
final String settingsIconPath = _getIconPath("menu_setting.svg");
final String logoutIconPath = _getIconPath("logout.svg");

//Icons helper function
String _getIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}
