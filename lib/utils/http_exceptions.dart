class CustomHttpException implements Exception {
  final String message;

  CustomHttpException(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); // Instance of HttpException
  }
}
