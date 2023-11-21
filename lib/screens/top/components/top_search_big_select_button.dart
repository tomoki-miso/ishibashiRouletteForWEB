import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/screens/search_confirm/page/search_confirm.dart';
import 'package:ishibashi/style/colors.dart';

class SearchBigSelectbutton extends StatelessWidget {
  const SearchBigSelectbutton({super.key});

  @override
  Widget build(BuildContext context) => BigSelectButton(
        backgroundColor: ColorName.topBlueGreen,
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchConfirmPage(),
            ),
          );
        },
        text: 'こだわり検索',
        iconChild: const FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          color: ColorName.whiteBase,
          size: 100,
        ),
      );
}
