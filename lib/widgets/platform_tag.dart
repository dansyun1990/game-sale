import 'package:flutter/material.dart';
import 'package:game_sale/constants/game_platform.dart';

class PlatformTag extends StatelessWidget {
  const PlatformTag({Key? key, required this.platform}) : super(key: key);

  final GamePlatform platform;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: (() {
          switch (platform) {
            case GamePlatform.ps4:
              return Colors.blue;
            case GamePlatform.ps5:
              return Colors.blue;
            case GamePlatform.nintendoSwitch:
              return Colors.red;
            case GamePlatform.steam:
              return Colors.grey;
          }
        })(),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Text(
        platform.value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 9.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
