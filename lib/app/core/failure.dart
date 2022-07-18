class Failure implements Exception {
  Failure(this.message);
  final String message;
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

class GetBatteryInfoFailure extends Failure {
  GetBatteryInfoFailure(String message) : super(message);
}

class AccessWifiFailure extends Failure {
  AccessWifiFailure(String message) : super(message);
}
