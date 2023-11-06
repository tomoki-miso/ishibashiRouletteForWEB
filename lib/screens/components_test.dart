import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/style/colors.dart';

class ComponentsTest extends ConsumerWidget {
  const ComponentsTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    backgroundColor: ColorName.greyBase,
    appBar: const OriginalAppBar(),
          body: Center(
            child: ListView(
              children: [
               
              ],
            ),
          ));
}
