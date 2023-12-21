import 'package:flutter/material.dart';

class AfterSignOutPage extends StatelessWidget {
  const AfterSignOutPage({super.key});

  @override
  Widget build(BuildContext context) => const PopScope(
        canPop: false,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ログアウトしました。\nアプリを一旦閉じてください。',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
}
