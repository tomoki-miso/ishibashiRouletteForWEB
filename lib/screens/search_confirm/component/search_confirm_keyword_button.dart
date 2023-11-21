import 'package:flutter/material.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/screens/search/page/keyword_search.dart';
import 'package:ishibashi/style/colors.dart';

class KeyWordButton extends StatelessWidget {
  const KeyWordButton({Key? key});

  @override
  Widget build(BuildContext context) => BigSelectButton(
        backgroundColor: ColorName.searchCBlue,
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const KeywordSearchPage(),
            ),
          );
        },
        text: 'キーワード検索',
        iconChild: const Icon(
          Icons.font_download_outlined,
          color: ColorName.whiteBase,
          size: 100,
        ),
      );
}
