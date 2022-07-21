abstract class Rest {
  final String serverAddress;
  final Duration timeoutDuration = const Duration(seconds: 40);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  Rest(this.serverAddress);

  dynamic get(String endpoint);
}
