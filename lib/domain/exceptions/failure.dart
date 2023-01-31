abstract class Failure implements Exception {
  String get message;
}

class InternalError implements Failure {
  @override
  final String message;
  InternalError({required this.message});
}
