// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double zoom;

  const GoogleMapWidget(
      {super.key,
      required this.latitude,
      required this.longitude,
      this.zoom = 17.0});

  static void showFullScreenMap(BuildContext context, double lat, double long,
      {double zoom = 17.0}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog.fullscreen(
          child: Stack(
            children: [
              GoogleMapWidget(
                latitude: lat,
                longitude: long,
                zoom: zoom,
              ),
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {},
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: zoom,
      ),
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      tiltGesturesEnabled: false,
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      markers: <Marker>{
        Marker(
          markerId: MarkerId("marker_id_1"),
          position: LatLng(latitude, longitude),
        ),
      },
    );
  }
}
