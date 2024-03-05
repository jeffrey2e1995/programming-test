// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/dimensions/dimensions.dart';
import 'package:people_list/presentation/pages/home/list_view/list_view_tile/list_view_tile.dart';
import 'package:people_list/presentation/widgets/loading_widget.dart';
import 'package:people_list/utils/constants/strings.dart';

class ListViewTab extends StatelessWidget {
  ListViewTab({super.key});

  final PeopleListStore _peopleListStore = getIt.get<PeopleListStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingHorizontal,
          // vertical: Dimensions.paddingVertical,
        ),
        child: _peopleListStore.isLoading
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
                : ListView(
                    children: _peopleListStore.peopleList!
                        .map((e) => ListViewTileWidget(
                              person: e,
                              onTap: () {
                                _onRecordTap(e);
                              },
                            ))
                        .toList(),
                  ),
      ),
    );
  }

  _onRecordTap(Person p) {
    if (_peopleListStore.currentPerson != null) {
      if (_peopleListStore.currentPerson == p) // unselect
      {
        _peopleListStore.setCurrentPerson(null);
        return;
      }
    }
    _peopleListStore.setCurrentPerson(p);
  }
}
