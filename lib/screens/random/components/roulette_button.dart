import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RouletteButton extends StatelessWidget {
  const RouletteButton({
    super.key,
    required Future<Null> Function() onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          onPressed: () {},
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.085,
          text: "ルーレットをまわす",
          style: Styles.RandomRoulette,
        ),
      );
}
