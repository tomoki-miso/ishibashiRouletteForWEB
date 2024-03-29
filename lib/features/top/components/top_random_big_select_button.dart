import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/features/random/page/random.dart';
import 'package:ishibashi/style/colors.dart';

class RandomBigSelectbutton extends StatelessWidget {
  const RandomBigSelectbutton({super.key});

  @override
  Widget build(BuildContext context) => BigSelectButton(
        backgroundColor: ColorName.topRed,
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RandomPage(),
            ),
          );
        },
        text: 'ランダムに決める',
        iconChild: const FaIcon(
          FontAwesomeIcons.shuffle,
          color: ColorName.whiteBase,
          size: 100,
        ),
      );
}
