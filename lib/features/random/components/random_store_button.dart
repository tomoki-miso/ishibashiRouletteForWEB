import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/random/view_model.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreButton extends ConsumerWidget {
  const StoreButton({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PrimaryButton(
        backgroundColor: ColorName.orangeBase,
        onPressed: () async {
          await ref
              .read(randomViewModelProvider.notifier)
              .navigateToStorePage(context, documentId);
        },
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.055,
        text: 'くわしく見る',
        style: Styles.randomRoulette,
      );
}
