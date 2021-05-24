import 'dart:async';

import 'package:first_app/buy_products/map/place_search.dart';
import 'package:first_app/buy_products/map/place_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import 'geometry.dart';
import 'location.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = Zoommap();
  final placeService = PlacesService();

  Position currentLocation;
  List<PlaceSearch> searchResults;
  StreamController<Place> seletedLocation = StreamController<Place>();
  Place selectedLocationStatic;
  String placeType;

  ApplicationBloc() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    selectedLocationStatic = Place(name: null, geometry: Geometry(location: Location(lat: currentLocation.latitude, lng: currentLocation.longitude)));
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placeService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placeService.getPlace(placeId);
    seletedLocation.add(await placeService.getPlace(placeId));
    selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) {
    if(selected){
      placeType = value;
    } else {
      placeType = null;
    }

    if(placeType != null) {
      var places = placeService.getPlaces(selectedLocationStatic.geometry.location.lat, selectedLocationStatic.geometry.location.lng, placeType);
    }
  }

  @override
  void dispose() {
    seletedLocation.close();
    super.dispose();
  }
}

class Zoommap {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
  }
}