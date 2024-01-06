abstract class BaseException implements Exception {
  String message;
  String? prefix;
  BaseException(this.message, [this.prefix]);

  @override
  String toString() => "$prefix$message";
}

class ServerException extends BaseException {
  ServerException([String? message])
      : super(message ?? "Internal Error", "Internal Error: ");
}

class DataParsingException extends BaseException {
  DataParsingException([String? message])
      : super(message ?? "Parsing Eror", "Parsing Error: ");
}

class NoConnectionException extends BaseException {
  NoConnectionException() : super("No internet connection");
}

class TokenExpireException extends UnauthorisedException {
  TokenExpireException() : super("You have been logout!");
}

class BadRequestException extends BaseException {
  BadRequestException([String? message])
      : super(message ?? "Invalid Request", "Invalid Request: ");
}

class UnauthorisedException extends BaseException {
  UnauthorisedException([String? message])
      : super(message ?? "Unauthorised", "Unauthorised: ");
}

class InvalidInputException extends BadRequestException {
  InvalidInputException([String? message]) : super(message ?? "Invalid Input");
}