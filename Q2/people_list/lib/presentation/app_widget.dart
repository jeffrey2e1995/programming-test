import 'package:flutter/material.dart';
import 'package:people_list/presentation/routes/router.dart';
import 'package:people_list/presentation/routes/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      key: navigatorKey,
    );
  }
}
