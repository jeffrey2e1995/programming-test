///
/// Dialog used for prompt message in the app
///

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:people_list/utils/constants/assets.dart';
import 'package:people_list/utils/constants/colors.dart';
import 'package:people_list/utils/constants/strings.dart';
import 'package:people_list/presentation/widgets/app_button_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.buttons,
      this.msgAlign = TextAlign.center,
      super.key});

  final Image? image;
  final String title;
  final String subTitle;
  final List<Widget>? buttons;
  final TextAlign msgAlign;

  static bool _showing = false;

  static Future<dynamic> show(
    BuildContext context, {
    Image? image,
    String title = "",
    String subTitle = "",
    List<Widget> buttons = const [],
    TextAlign msgAlign = TextAlign.center,
  }) async {
    if (_showing) return;
    _showing = true;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return DialogWidget(
          image: image,
          title: title,
          subTitle: subTitle,
          buttons: buttons,
          msgAlign: msgAlign,
        );
      },
    );
    _showing = false;
  }

  static Future<dynamic> showErrorDialog(
    BuildContext context,
    String msg, {
    String? title,
    TextAlign msgAlign = TextAlign.center,
  }) async {
    await DialogWidget.show(
      context,
      image: Image.asset(Assets.popupWarningIcon),
      title: title ?? Strings.error,
      subTitle: msg,
      buttons: [
        AppButtonWidget(
          text: Strings.ok,
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
      msgAlign: msgAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: AppColors.dialogBgDarkBlue,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              SizedBox(
                width: 150,
                height: 150,
                child: image,
              ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              subTitle,
              textAlign: msgAlign,
              style: TextStyle(
                color: AppColors.dialogMsgGrey,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (buttons != null)
              Row(
                children: buttons!
                    .map((button) => Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: button,
                        )))
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}
