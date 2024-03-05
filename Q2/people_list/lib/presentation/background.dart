import 'package:flutter/material.dart';

import '../utils/constants/assets.dart';

class Background extends StatelessWidget {
  const Background({required this.child, this.bottomNavigationBar, super.key});

  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Assets.bgImage,
              fit: BoxFit.fill,
            ).image,
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
