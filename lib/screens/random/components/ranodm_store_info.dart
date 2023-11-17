import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/style/colors.dart';

class RandomStoreInfo extends StatelessWidget {
  const RandomStoreInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [Text("#ラーメン, #中華料理")],
      );
}
