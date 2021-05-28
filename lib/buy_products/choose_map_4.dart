import 'package:first_app/buy_products/map/application_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'map/geometry.dart';

class ChooseMap extends StatefulWidget {
  const ChooseMap({Key key}) : super(key: key);

  @override
  _ChooseMapState createState() => _ChooseMapState();
}

class _ChooseMapState extends State<ChooseMap> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApplicationBloc(),
        child: MaterialApp(home: screen()));
  }
}

class screen extends StatefulWidget {
  const screen({Key key}) : super(key: key);

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription locationSubcription;

  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.seletedLocation.stream.listen((place) {
      if(place != null) {
        _goToPlace(place);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    locationSubcription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: (applicationBloc == null)
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Tìm vị trí",
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => applicationBloc.searchPlaces(value),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 60,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              applicationBloc.currentLocation.latitude,
                              applicationBloc.currentLocation.longitude,
                            ),
                            zoom: 14),
                        onMapCreated: (GoogleMapController controller) {
                          _mapController.complete(controller);
                        },
                      ),
                    ),
                    if (applicationBloc.searchResults != null &&
                        applicationBloc.searchResults.length != 0)
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.5),
                            //backgroundBlendMode: BlendMode.darken
                          ),
                      ),
                    if (applicationBloc.searchResults != null &&
                        applicationBloc.searchResults.length != 0)
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: applicationBloc.searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(applicationBloc
                                .searchResults[index].description, style: TextStyle(color: Colors.white)),
                            onTap: () {
                              applicationBloc.setSelectedLocation(applicationBloc.searchResults[index].placeId);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 14)));
  }
}
