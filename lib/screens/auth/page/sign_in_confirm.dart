import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ishibashi/firebase/firebase_options.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInConfirmPage extends StatelessWidget {
  const SignInConfirmPage({Key? key});

  static final googleLogin = GoogleSignIn(
    clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => YourNextScreen(), // 遷移先の画面を指定
          ),
        );
      } else {
        // Handle sign-in cancellation or error
      }
    } catch (e) {
      print("サインイン中にエラーが発生しました: $e");
      // エラーを処理したり、エラーメッセージを表示したり、適切なアクションを実行したりします
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SignInButton(Buttons.google, onPressed: () => logIn(context)),
          ],
        ),
      );
}

class YourNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('次の画面'),
      ),
      body: Center(
        child: Text('サインイン後の画面'),
      ),
    );
  }
}
