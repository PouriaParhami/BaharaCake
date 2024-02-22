class ApiConst{
  ApiConst._();

  static const String baseUrl = "https://baharacake.com";
  static const String wpApi = "/wp-json/wp/v2";
  static const String pages = "/pages";
  static const String mainUrl = "$baseUrl$wpApi$pages";
}