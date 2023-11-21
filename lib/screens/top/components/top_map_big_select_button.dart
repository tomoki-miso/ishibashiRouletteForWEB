import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/screens/map.dart';
import 'package:ishibashi/style/colors.dart';

class MapBigSelectbutton extends StatelessWidget {
  const MapBigSelectbutton({super.key});

  @override
  Widget build(BuildContext context) => BigSelectButton(
        backgroundColor: ColorName.topGreen,
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()),
          );
        },
        text: '地図から探す',
        iconChild: const FaIcon(
          FontAwesomeIcons.mapLocationDot,
          color: ColorName.whiteBase,
          size: 100,
        ),
      );
}
