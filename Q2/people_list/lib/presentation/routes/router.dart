// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:people_list/presentation/routes/routes.dart';

final router = GoRouter(
  routes: Routes.routes.entries
      .map(
        (entity) => GoRoute(
          path: entity.key,
          builder: entity.value,
        ),
      )
      .toList(),
);
