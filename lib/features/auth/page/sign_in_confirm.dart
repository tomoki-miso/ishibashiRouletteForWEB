import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ishibashi/features/auth/signin/sign_in_with_apple.dart';
import 'package:ishibashi/features/auth/signin/sign_in_with_google.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInConfirmPage extends StatelessWidget {
  const SignInConfirmPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(60)),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset('assets/images/icon.png'),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const Text(
                  '「石橋ご飯ルーレット」に登録している場合はサインインを行います。\n「石橋ご飯ルーレット」に登録していない場合は登録を行います。',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: SignInButton(
                  Buttons.google,
                  onPressed: () async => signInWiithGoogle(context),
                ),
              ),
              if (Platform.isIOS)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SignInButton(
                    Buttons.apple,
                    onPressed: () async => signInWithApple(context),
                  ),
                ),
            ],
          ),
        ),
      );
}
