import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class Styles {
  static const storeNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );

  static const storeDetailStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const subTitleStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const businnesHours = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const tagsTextStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    overflow: TextOverflow.clip,
  );

  static const DrawerTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ColorName.blackSecondary,
  );

  static const DrawerSubTitle = TextStyle(
    fontSize: 14,
    color: ColorName.blackSecondary,
  );

  static const detailStoreName = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const RandomStore = TextStyle(
    fontSize: 17,
    color: ColorName.whiteBase,
  );

  static const RandomRoulette = TextStyle(
    fontSize: 21,
    color: ColorName.whiteBase,
  );
}
