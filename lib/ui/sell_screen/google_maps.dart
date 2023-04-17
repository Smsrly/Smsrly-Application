import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

class GoogleMaps extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Google Maps"), backgroundColor: primaryColor),
      body: Consumer<AppViewModel>(
        builder: (context, appViewModel, child) {
          return GoogleMap(
            markers: {
              Marker(
                  markerId: const MarkerId("location"),
                  infoWindow: const InfoWindow(title: "your location"),
                  position: appViewModel.location,
                  icon: BitmapDescriptor.defaultMarker)
            },
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: appViewModel.location,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (argument) {
              appViewModel.changeLocation(argument);
            },
          );
        },
      ),
    );
  }
}
