import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      scopes: [],
    );
  } else if (Platform.isAndroid) {
    googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
      scopes: [],
    );
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    configureGoogleSignIn();
    final GoogleSignInAccount? signInAccount = await googleSignIn?.signIn();
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('user_info')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        // Firestoreのドキュメントが存在する場合
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                const BasePage(), // Firestoreのドキュメントが存在する場合の遷移先
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

        // Firestoreのドキュメントが存在しない場合
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                const QuestionnairePage(), // Firestoreのドキュメントが存在しない場合の遷移先
          ),
        );
      }
    }
  } catch (e) {
    debugPrint('サインイン中にエラーが発生しました: $e');
  }
}
