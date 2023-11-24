import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/screens/auth/page/after_sign_out.dart';

class TopSignOutAlertDialog extends StatelessWidget {
  const TopSignOutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: const Text('本当にサインアウトしますか？'),
        content: const Text('サインアウトしても、再度サインインすることであなたの情報は復元できます。'),
        actions: [
          CupertinoDialogAction(
            child: const Text('いいえ'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text('はい'),
            onPressed: () async => _signOut(context),
          ),
        ],
      );
}

Future<void> _signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();

  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const AfterSignOutPage(),
    ),
  );
}
