// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/pages/home/list_view/detail/detail.dart';
import 'package:people_list/utils/constants/assets.dart';
import 'package:people_list/utils/constants/colors.dart';

class ListViewTileWidget extends StatelessWidget {
  ListViewTileWidget({
    super.key,
    required this.person,
    required this.onTap,
  });

  final Person person;
  final PeopleListStore _peopleListStore = getIt.get<PeopleListStore>();

  // Event when the record is tapped
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Observer(builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: AppColors.infoTileBgGrey,
              borderRadius: BorderRadius.circular(5.0),
              border: _peopleListStore.currentPerson == person
                  ? Border.all(color: Colors.white, width: 3.0)
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildImage(),
                      SizedBox(
                        width: 20,
                      ),
                      _buildName(),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _openDetail(context, person);
                  },
                  child: Icon(
                    Icons.launch_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  _buildImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: person.picture == null
              ? Image.asset(
                  Assets.defaultProfileImage,
                  fit: BoxFit.fill,
                ).image
              : Image.network(
                  person.picture!,
                  fit: BoxFit.fill,
                ).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildName() {
    return Expanded(
      child: RichText(
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
    );
  }

  _openDetail(BuildContext context, Person p) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => DetailScreen(person: p),
      ),
    );
  }
}
