// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppButtonWidget extends StatefulWidget {
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
  State<AppButtonWidget> createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.7 : 1.0,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            // color: widget.highLight ? AppColors.hex_EAB646 : Colors.transparent,
            color: widget.highLight ? Colors.amber : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              // color: AppColors.hex_EAB646,
              color: Colors.amber,
              width: 1.0,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 35,
                        color: widget.highLight ? Colors.amber : Colors.blue,
                        // ? AppColors.hex_0B202D
                        // : AppColors.hex_EAB646,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
