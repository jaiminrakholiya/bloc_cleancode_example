class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

// Commonly Used Exceptions in App Development

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorized Access');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, 'Request Timed Out');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Data Fetch Failed');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Error');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Access Forbidden');
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, 'Data Conflict');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
