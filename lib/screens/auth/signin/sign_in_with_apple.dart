import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/screens/questionnaire/page/questionnaire.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> signInWithApple(BuildContext context) async {
  try {
    // AppleIDの認証情報を取得
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // OAuthのプロバイダーを作成
    final OAuthProvider oauthProvider = OAuthProvider('apple.com');
    final credential = oauthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    // ユーザーの取得
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // ログインしているユーザーが存在する場合、画面遷移する
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BasePage(), // 遷移先の画面を指定
        ),
      );
    } else {
      // ユーザーが存在しない場合、新しいアカウントを作成してログインする
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // 新しいアカウントが作成された後の処理や画面遷移を行う
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const QuestionnairePage(), // 遷移先の画面を指定
        ),
      );
    }
  } catch (e) {
    // エラー処理はそのまま
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('エラー'),
        content: Text(e.toString()),
      ),
    );
  }
}
