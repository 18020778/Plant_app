import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = Zoommap();

  Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
}

class Zoommap {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
  }
}