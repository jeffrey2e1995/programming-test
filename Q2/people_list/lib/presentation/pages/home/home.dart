// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/background.dart';
import 'package:people_list/presentation/pages/home/list_view/list_view.dart';
import 'package:people_list/presentation/pages/home/map_view/map_view.dart';
import 'package:people_list/utils/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final PeopleListStore _peopleListStore = getIt.get<PeopleListStore>();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _peopleListStore.getPeopleList(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: Strings.listViewTabTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: Strings.mapViewTabTitle,
          ),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListViewTab(),
        MapViewTap(),
      ],
    );
  }
}
