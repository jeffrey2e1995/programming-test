// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final Marker center;
  final double zoom;
  final List<Marker> markers;

  const GoogleMapWidget({
    super.key,
    required this.center,
    this.zoom = 13.0,
    required this.markers,
  });

  static void showFullScreenMap(BuildContext context,
      {required Marker center,
      required List<Marker> markers,
      double zoom = 13.0}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog.fullscreen(
          child: Stack(
            children: [
              GoogleMapWidget(
                center: center,
                zoom: zoom,
                markers: markers,
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
      onMapCreated: (controller) {
        controller.showMarkerInfoWindow(center.markerId);
      },
      initialCameraPosition: CameraPosition(
        target: center.position,
        zoom: zoom,
      ),
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
      tiltGesturesEnabled: false,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      markers: markers.map((e) => e).toSet(),
    );
  }
}
