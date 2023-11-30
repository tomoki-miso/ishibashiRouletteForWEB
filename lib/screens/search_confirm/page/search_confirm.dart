import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/screens/search_confirm/component/search_confirm_business_day_button.dart';
import 'package:ishibashi/screens/search_confirm/component/search_confirm_keyword_button.dart';

class SearchConfirmPage extends StatelessWidget {
  const SearchConfirmPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: OriginalAppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(26, 32, 300, 17),
              child: Text(
                '検索',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.start,
              ),
            ),
            BusinessDayButton(),
            Padding(padding: EdgeInsets.all(18)),
            KeyWordButton(),
          ],
        ),
      );
}
