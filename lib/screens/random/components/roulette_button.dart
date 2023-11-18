import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/style/styles.dart';

class RouletteButton extends StatelessWidget {
  const RouletteButton({
    super.key,
    required Future<void> Function() onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: PrimaryButton(
          onPressed: () {},
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          text: 'ルーレットをまわす',
          style: Styles.RandomRoulette,
        ),
      );
}
