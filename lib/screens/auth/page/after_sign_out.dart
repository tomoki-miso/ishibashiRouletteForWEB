import 'package:flutter/material.dart';

class AfterSignOutPage extends StatelessWidget {
  const AfterSignOutPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Column(
        children: [Text('ログアウトしました。\nアプリを一旦閉じてください。')],
      ),
    );
}
