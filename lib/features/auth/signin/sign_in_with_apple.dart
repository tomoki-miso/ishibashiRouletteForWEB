import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/features/questionnaire/page/questionnaire.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> signInWithApple(BuildContext context) async {
  try {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final OAuthProvider oauthProvider = OAuthProvider('apple.com');
    final credential = oauthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? currentUser = userCredential.user;

    if (currentUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('user_info')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                const BasePage(), // Firestoreのドキュメントが存在する場合の遷移先
          ),
        );
      } else {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                const QuestionnairePage(), // Firestoreのドキュメントが存在しない場合の遷移先
          ),
        );
      }
    }
  } catch (e) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('エラー'),
        content: Text(e.toString()),
      ),
    );
  }
}
