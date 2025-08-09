abstract class Failures {
  final String message;

  Failures({this.message = ""});
}

class ServerFailure extends Failures {
  ServerFailure({String message = "Server Error"}) : super(message: message);
}

class NetworkFailure extends Failures {
  NetworkFailure({String message = "Network Error"}) : super(message: message);
}
