import 'package:flutter/material.dart';
import 'package:people_list/utils/connectivity/connectivity_status_listener.dart';
import 'package:people_list/utils/constants/assets.dart';

class PictureWidget extends StatefulWidget {
  const PictureWidget({required this.imageUrl, super.key});

  final String? imageUrl;

  @override
  State<PictureWidget> createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: widget.imageUrl == null || !isConnectedToNetwork
              ? Image.asset(
                  Assets.defaultProfileImage,
                  fit: BoxFit.fill,
                ).image
              : Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.fill,
                ).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
