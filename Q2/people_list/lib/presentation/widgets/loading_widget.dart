// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.size = 80.0, this.color = Colors.white, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SimpleDialog(
        elevation: 0.0,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Center(
            child: SpinKitFadingCircle(
              color: color,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
