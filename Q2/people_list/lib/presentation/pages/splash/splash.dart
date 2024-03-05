import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:people_list/presentation/routes/routes.dart';
import 'package:people_list/presentation/widgets/app_icon_widget.dart';
import 'package:people_list/utils/constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // // init stuff then navigate
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Assets.bgImage,
            ).image,
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: AppIconWidget(image: Assets.iconsIcAppiconPng),
        ),
      ), // mimic from flutter_native_splash.yaml
    );
    // same as native splash
  }

  startTimer() {
    Duration duration = const Duration(milliseconds: 2000);
    return Timer(duration, navigate);
  }

  navigate() async {
    context.go(Routes.home);
  }
}
