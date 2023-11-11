import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/firebase/firebase_options.dart';

final GoogleSignIn googleLogin = GoogleSignIn(
  clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

  Future<void> logInbyGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? signinAccount = await googleLogin.signIn();

      if (signinAccount != null) {
        final GoogleSignInAuthentication auth =
            await signinAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: auth.idToken,
          accessToken: auth.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);

        // サインイン後の画面遷移
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BasePage(), // 遷移先の画面を指定
          ),
        );
      } else {
        // Handle sign-in cancellation or error
      }
    } catch (e) {
      if (kDebugMode) {
        print("サインイン中にエラーが発生しました: $e");
      }
    }
  }

// Googleサインインに関連する他のコード
