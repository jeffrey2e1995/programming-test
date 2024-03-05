///
/// Button widget for buttons
///

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:people_list/utils/constants/colors.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.text,
    required this.onTap,
    this.highLight = true,
    this.disabled = false,
    super.key,
  });

  final String text;
  final void Function() onTap;
  final bool highLight;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: disabled ? 0.7 : 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: highLight ? AppColors.hex_EAB646 : Colors.transparent,
            border: Border.all(
              color: AppColors.hex_EAB646,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: highLight ? AppColors.hex_0B202D : AppColors.hex_EAB646,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
