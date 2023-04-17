import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smsrly/utils/routes/route_name.dart';

class GoogleMapsWidget extends StatelessWidget {
  LatLng latLng;
  bool changeLocation;

  GoogleMapsWidget(this.latLng, this.changeLocation, {super.key});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: {
        Marker(
            markerId: const MarkerId("userLocation"),
            infoWindow: const InfoWindow(title: "Location"),
            position: latLng,
            icon: BitmapDescriptor.defaultMarker)
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: latLng,
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
      },
      onTap: (_) => Navigator.of(context).pushNamed(RouteName.googleMapsRoute,
          arguments: {
            'changeLocation': changeLocation ? true : false,
            'location': latLng
          }),
    );
  }
}
