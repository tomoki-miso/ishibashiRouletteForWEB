import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/screens/random/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class RouletteButton extends ConsumerWidget {
  const RouletteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.all(5),
        child: PrimaryButton(
          backgroundColor: ColorName.randomRed,
          onPressed: () async {
            await ref.read(randomViewModelProvider.notifier).getStores();
            await FirebaseAnalytics.instance.logEvent(name: 'ルーレット押下');
          },
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          text: 'ルーレットをまわす',
          style: Styles.randomRoulette,
        ),
      );
}
