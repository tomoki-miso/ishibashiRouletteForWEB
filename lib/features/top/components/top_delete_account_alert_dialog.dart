import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/features/auth/page/after_sign_out.dart';

class TopDeleteAccountAlertDialog extends StatelessWidget {
  const TopDeleteAccountAlertDialog({super.key});

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: const Text('本当に退会しますか？'),
        content: const Text('退会すると、あなたに関する情報はすべて削除されていしまいます。'),
        actions: [
          CupertinoDialogAction(
            child: const Text('はい'),
            onPressed: () async => _deleteAccount(context),
          ),
          CupertinoDialogAction(
            child: const Text('いいえ'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
}

Future<void> _deleteAccount(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  final uid = user?.uid;
  // userコレクションを削除
  await FirebaseFirestore.instance.collection('user_info').doc(uid).delete();

  await user?.delete();
  await FirebaseAuth.instance.currentUser?.delete();

  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const AfterSignOutPage(),
    ),
  );
}
