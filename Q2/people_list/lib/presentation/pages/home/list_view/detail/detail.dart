// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/presentation/background.dart';
import 'package:people_list/presentation/widgets/map/google_map_widget.dart';
import 'package:people_list/presentation/widgets/picture/picture_widget.dart';
import 'package:people_list/utils/constants/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.person, super.key});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          _buildMap(context),
          _buildInfo(),
        ],
      ),
    );
  }

  _buildMap(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GoogleMapWidget(
            center: Marker(
                markerId: MarkerId(person.id),
                position: LatLng(person.location?.latitude ?? 0.0,
                    person.location?.longitude ?? 0.0)),
            markers: [
              Marker(
                markerId: MarkerId(person.id),
                position: LatLng(
                  person.location?.latitude ?? 0.0,
                  person.location?.longitude ?? 0.0,
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 10,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.infoTileBgGrey,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                PictureWidget(
                  imageUrl: person.picture,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: person.name?.first ?? "---",
                          children: [
                            TextSpan(
                              text: ', ${person.name?.last ?? "---"}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        person.email ?? "---",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
