import '../constants/app_strings.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);
}

class ServerException extends AppException {
  ServerException([super.message = AppStrings.serverError]);
}

class NetworkException extends AppException {
  NetworkException([super.message = AppStrings.internetError]);
}

class ParsingException extends AppException {
  ParsingException([super.message = AppStrings.parsingError]);
}
