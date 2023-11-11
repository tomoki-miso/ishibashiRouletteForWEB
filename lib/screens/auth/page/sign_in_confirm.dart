import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/screens/auth/page/email_sign_in.dart';
import 'package:ishibashi/screens/auth/sign_in_with_google.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInConfirmPage extends StatelessWidget {
  const SignInConfirmPage();

  Future<void> logIn(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SignInButton(
              Buttons.email,
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => EmailSignInPage(),
                  ),
                );
              },
            ),
            SignInButton(Buttons.google, onPressed: () => logIn(context)),
          ],
        ),
      );
}
