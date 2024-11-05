class AppExceptions implements Exception {

  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message$_prefix";
  }

}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message]): super(message, "No Internet Connection");
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]): super(message, " Un Authorized Exception");
}

class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([String? message]): super(message, " Request Timeout Exception");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]): super(message, " Fetch Data Exception");
}