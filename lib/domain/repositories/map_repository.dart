import 'package:wassilni_maak/data/providers/firebase.dart';

class MapRepository {
  Map<String, dynamic>? _config;

  Future<String> getToken() async {
    return _getConfig('token');
  }

  Future<String> getScript() async {
    return _getConfig('script');
  }

  Future<String> _getConfig(String key) async {
    _config ??= await FirebaseApi().getConfig();
    return _config![key];
  }
}
