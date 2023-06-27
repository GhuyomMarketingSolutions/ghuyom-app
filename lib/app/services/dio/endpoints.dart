class Endpoints {
  Endpoints._();

  /// google API keys
  static const String googlePlacesAPIKey =
      'AIzaSyDWYe8tPdGm-JECzpmg0ZLiN1b0YB5LCho';


  // base url
  static const String baseUrl = "http://13.51.195.68:7000/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  //post url
  static const String login = 'api/v1/owner/login';
  static const String onboarding = 'api/v1/owner/onboarding';
}
