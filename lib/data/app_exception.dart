class AppException implements Exception{
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString(){
    return '$prefix$message';
  }

}


class FetchDataException extends AppException{
  FetchDataException(String? message) : super(message!, 'Error while Fetching');
}

class BadRequestException extends AppException{
  BadRequestException(String? message) : super(message!, 'Invalid Request');
}

class InvalidInputException extends AppException{
  InvalidInputException(String? message) : super(message!, 'Invalid Input');
}

class NoInternetException extends AppException{
  NoInternetException(String? message) : super(message!, 'No Internet Connection');
}