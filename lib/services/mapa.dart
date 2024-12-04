import 'package:flutter/foundation.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

Future<LocationData?> obterLocal() async {
  Location location = Location();

  if(!kIsWeb){
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
  }

  return await location.getLocation();
}

Future<Address> getAddress(double lat, double lon) async {
  GeoCode geoCode = GeoCode();
  Address address = await geoCode.reverseGeocoding(latitude: lat, longitude: lon);
  return address;
}