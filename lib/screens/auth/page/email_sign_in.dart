import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/base.dart';

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // メールアドレス入力
                TextFormField(
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                // パスワード入力
                TextFormField(
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  // メッセージ表示
                  child: Text(infoText),
                ),
                SizedBox(
                  width: double.infinity,
                  // ユーザー登録ボタン
                  child: ElevatedButton(
                    child: const Text('ユーザー登録'),
                    onPressed: () async {
                      try {
                        // メール/パスワードでユーザー登録
                        final FirebaseAuth auth = FirebaseAuth.instance;

                        // Check if the user with the provided email already exists
                        UserCredential userCredential;
                        try {
                          userCredential =
                              await auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                        } catch (signInError) {
                          // User not found, proceed with registration
                          userCredential =
                              await auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                        }

                        // ユーザー登録に成功した場合
                        // チャット画面に遷移＋ログイン画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const BasePage()),
                        );
                      } catch (e) {
                        // ユーザー登録に失敗した場合
                        setState(() {
                          infoText = '登録に失敗しました：$e';
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
