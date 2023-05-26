
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  static const CameraPosition _kLake = CameraPosition(
     // bearing: 192.8334901395799,
      target: LatLng(41.068593, 29.045329),
      //tilt: 59.440717697143555,
      zoom: 18);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:GoogleMap(

        mapType: MapType.normal,
        initialCameraPosition: _kLake,
markers: {
  Marker(
      consumeTapEvents: true,
      markerId: MarkerId('default'),
      position: _kLake.target,
      )
},
      ),
    );
  }
}




