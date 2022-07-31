abstract class Rest {
  final String serverAddress;
  final Duration timeoutDuration = const Duration(seconds: 120);

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': '*/*',
  };

  Rest(this.serverAddress);

  dynamic get(String endpoint);
}
