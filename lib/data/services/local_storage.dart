import 'package:shared_preferences/shared_preferences.dart';
import 'package:wassilni_maak/data/entities/lat_lng.dart';

//Unused feature
class LocalStorage {
  static const double defaultLatitude = 0;
  static const double defaultLongitude = 0;

  Future<LatLng> getLastLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double latitude = prefs.getDouble('lat') ?? defaultLatitude;
    double longitude = prefs.getDouble('lng') ?? defaultLongitude;
    LatLng location = LatLng(latitude, longitude);
    return location;
  }

  Future<bool> setLastLocation(LatLng location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lat', location.latitude);
    prefs.setDouble('lng', location.longitude);

    if (prefs.getDouble('lat') != location.latitude ||
        prefs.getDouble('lng') != location.longitude) {
      return false;
    }

    return true;
  }
}
