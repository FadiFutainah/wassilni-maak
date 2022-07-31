import 'package:location/location.dart';
import 'package:wassilni_maak/data/entities/lat_lng.dart';
import 'package:wassilni_maak/data/services/local_storage.dart';

class DeviceLocation {
  Location location = Location();
  LocationData? locationData;
  LatLng? lastLocation;

  Future<bool> hasService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> hasPermission() async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<LatLng> getLocation() async {
    if (await hasService() && await hasPermission()) {
      locationData = await location.getLocation();
    }

    lastLocation = await LocalStorage().getLastLocation();

    if (locationData != null) {
      return LatLng(locationData!.latitude ?? 0, locationData!.longitude ?? 0);
    }

    return LatLng(lastLocation!.latitude, lastLocation!.longitude);
  }
}
