class Endpoints {
  Endpoints._();

  /// google API keys
  static const String googlePlacesAPIKey =
      'AIzaSyBzX03vLiBIYVLFQurw9Ldtc_tsHqUZ2GU';

  // base url
  static const String baseUrl = "http://13.51.195.68:7000/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // Get url
  static const String getAllBusiness = 'api/v1/owner/business/all';
  static const String getAllBusinessNoAuth = 'api/v1/owner/business/noAuth/all';
  static const String getABusiness = 'api/v1/owner/business/details/';
  static const String getAllServices = 'api/v1/owner/service/';
  static const String getSearchResult =
      'api/v1/owner/business/search-suggestion';

  // Post url
  static const String login = 'api/v1/owner/login';
  static const String onboarding = 'api/v1/owner/onboarding';
  static const String addBusiness = 'api/v1/owner/business/add';
  static const String addService = 'api/v1/owner/service/';
  static const String addMultiplePhotos = 'api/v1/file/upload/multiple';
  static const String addSinglePhoto = 'api/v1/file/upload/single';

  // Delete url
  static const String deleteBusiness = 'api/v1/owner/business/';
  static const String deleteService = 'api/v1/owner/service/';

  // Put url
  static const String putBusiness = 'api/v1/owner/business/edit/';
  static const String putUpdateUser = 'api/v1/owner/update';
}
