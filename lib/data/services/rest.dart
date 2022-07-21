abstract class Rest {
  final String serverAddress = '';
  final Duration timeoutDuration = const Duration(seconds: 40);
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  dynamic get(String endpoint);
  dynamic post(String endpoint, Map<String, dynamic> body);
}
