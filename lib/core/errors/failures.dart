abstract class Failure {
  final String message;

  Failure( this.message);
}
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CustomException extends Failure {
  CustomException(super.message);
}