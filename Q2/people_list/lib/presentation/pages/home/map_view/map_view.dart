// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/widgets/loading_widget.dart';
import 'package:people_list/presentation/widgets/map/google_map_widget.dart';
import 'package:people_list/utils/constants/strings.dart';

class MapViewTap extends StatelessWidget {
  MapViewTap({super.key});

  final PeopleListStore _peopleListStore = getIt.get<PeopleListStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return _peopleListStore.isLoading
            ? LoadingWidget()
            : _peopleListStore.peopleList == null ||
                    _peopleListStore.peopleList!.isEmpty
                ? Center(
                    child: Text(
                      Strings.noRecordMsg,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
                : GoogleMapWidget(
                    center: LatLng(
                        _peopleListStore.peopleList?[1].location?.latitude ??
                            0.0,
                        _peopleListStore.peopleList?[1].location?.longitude ??
                            0.0),
                    markers: _peopleListStore.peopleList!.map((e) {
                      return LatLng(
                        e.location?.latitude ?? 0.0,
                        e.location?.longitude ?? 0.0,
                      );
                    }).toList(),
                  );
      },
    );
  }
}
