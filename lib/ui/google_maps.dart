import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

class GoogleMaps extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool? canChangeLocation = args['changeLocation'];
    LatLng location = args['location'];
    return Scaffold(
      body: Consumer<AppViewModel>(
        builder: (context, appViewModel, child) {
          return GoogleMap(
            markers: {
              Marker(
                  markerId: const MarkerId("location"),
                  infoWindow: const InfoWindow(title: "Location"),
                  position:
                      canChangeLocation! ? appViewModel.location : location,
                  icon: BitmapDescriptor.defaultMarker)
            },
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: canChangeLocation! ? appViewModel.location : location,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (argument) {
              if (canChangeLocation!) {
                appViewModel.changeLocation(argument);
              }
            },
          );
        },
      ),
    );
  }
}
