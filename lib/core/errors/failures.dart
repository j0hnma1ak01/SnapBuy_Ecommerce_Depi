abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage});
}
