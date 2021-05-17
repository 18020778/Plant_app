import 'package:first_app/buy_products/map/application_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
        child: MaterialApp(
            home: screen())
    );
  }
}

  class screen extends StatefulWidget {
    const screen({Key key}) : super(key: key);

    @override
    _screenState createState() => _screenState();
  }

  class _screenState extends State<screen> {
  @override
    Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
      return  Scaffold(
        body: (applicationBloc == null)
          ? Center(child: CircularProgressIndicator())
        : ListView(
          children: [
            TextField(
                decoration: InputDecoration(
                    hintText: "Tìm vị trí"
                ),
              ),
            Container(
              height: 300,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(applicationBloc.currentLocation.latitude, applicationBloc.currentLocation.longitude,),
                        zoom: 14
                ),
              ),
            )
          ],
        ),
      );
    }
  }


