// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/background.dart';
import 'package:people_list/presentation/pages/home/list_view/list_view.dart';
import 'package:people_list/presentation/pages/home/map_view/map_view.dart';
import 'package:people_list/utils/constants/colors.dart';
import 'package:people_list/utils/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PeopleListStore _peopleListStore = getIt.get<PeopleListStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _peopleListStore.getPeopleList(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Background(
        child: _buildBody(context),
        bottomNavigationBar: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.hex_A5A5A9,
              ),
            ),
          ),
          child: TabBar(
            // controller: _tabController,
            // isScrollable: true,
            labelColor: AppColors.hex_F3A71E,
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: AppColors.hex_A5A5A9,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            indicatorColor: AppColors.hex_F3A71E,
            tabs: [
              Tab(
                text: Strings.listViewTabTitle,
              ),
              Tab(
                text: Strings.mapViewTabTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return TabBarView(
      children: [
        ListViewTab(),
        MapViewTap(),
      ],
    );
  }
}
