class AppDomain {
  static String domain = 'https://api-charging.onrender.com';

  /// Auth
  static String login = '$domain/users/login';
  static String forgotpassword = '$domain/users/forgotpassword';
  static String changepassword = '$domain/users/changepassword';

  /// Media
  static String uploadimage = '$domain/uploadimages/uploadimage';
  static String getinfocharg = '$domain/chargin/getinfochargall';

  static String addStation = '$domain/chargin/insertinfocharg';
  static String getchargebyid = '$domain/chargin/getchargbyid';
}