import 'package:pak_festive/utils/constants.dart';

class ApiEndPoints{
   /// apis
  static String liveBaseUrl =
      'https://abcdefghijklmnopqrstuvwxyz.com/';
 
  static String localBaseUrl =
      'https://abcdefghijklmnopqrstuvwxyz.com/';


  static String brandUrl = "${Constants.isDeveloping?localBaseUrl:liveBaseUrl}brand/";
 
  static String loginUrl = "${brandUrl}login";
 
 


}