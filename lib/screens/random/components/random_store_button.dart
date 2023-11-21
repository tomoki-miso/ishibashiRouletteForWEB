import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/store_details/page/store_rondom_detail.dart';
import 'package:ishibashi/style/styles.dart';

class StoreButton extends StatelessWidget {
  const StoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PrimaryButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StorePage(),
            ),
          );
        },
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.06,
        text: 'くわしく見る',
        style: Styles.RandomRoulette,
      );
}
