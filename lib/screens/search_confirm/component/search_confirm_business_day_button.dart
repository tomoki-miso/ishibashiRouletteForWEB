import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/screens/search/business_day_search/page/business_day_search.dart';
import 'package:ishibashi/style/colors.dart';

class BusinessDayButton extends StatelessWidget {
  const BusinessDayButton({super.key});

  @override
  Widget build(BuildContext context) => BigSelectButton(
        backgroundColor: ColorName.searchPurple,
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BusinessDaySearchPage(),
            ),
          );
        },
        text: '営業日で検索',
        iconChild: const FaIcon(
          FontAwesomeIcons.clock,
          color: ColorName.whiteBase,
          size: 100,
        ),
      );
}
