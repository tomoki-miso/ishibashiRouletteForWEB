import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreButton extends StatelessWidget {
  const StoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          onPressed: () {},
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
          text: "ストアページ",
          style: Styles.RandomRoulette,
        ),
      );
}
