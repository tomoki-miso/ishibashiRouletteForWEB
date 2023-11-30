import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/features/questionnaire/page/questionnaire.dart';
import 'package:ishibashi/firebase/firebase_options.dart';

GoogleSignIn? googleSignIn; // 変数をグローバルスコープに移動

void configureGoogleSignIn() {
  if (Platform.isIOS) {
    googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      scopes: [
        'email',
      ],
    );
  } else if (Platform.isAndroid) {
    googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
      scopes: [
        'email',
      ],
    );
  }
}

Future<void> signInWiithGoogle(BuildContext context) async {
  try {
    configureGoogleSignIn();
    final GoogleSignInAccount? signInAccount = await googleSignIn?.signIn();
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BasePage(), // 遷移先の画面を指定
        ),
      );
    } else {
      final GoogleSignInAuthentication auth =
          await signInAccount!.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // サインイン後の画面遷移
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const QuestionnairePage(), // 遷移先の画面を指定
        ),
      );
    }
  } catch (e) {
    debugPrint('サインイン中にエラーが発生しました: $e');
  }
}