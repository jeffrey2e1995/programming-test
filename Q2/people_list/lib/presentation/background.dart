import 'package:flutter/material.dart';

import '../untils/constants/assets.dart';

class Background extends StatelessWidget {
  const Background({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
