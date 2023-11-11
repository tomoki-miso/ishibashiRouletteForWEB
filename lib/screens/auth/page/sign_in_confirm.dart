import 'package:flutter/material.dart';
import 'package:ishibashi/screens/auth/page/email_sign_in.dart';
import 'package:ishibashi/screens/auth/signin/sign_in_with_google.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInConfirmPage extends StatelessWidget {
  const SignInConfirmPage();

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
            SignInButton(Buttons.google, onPressed: () async => logInbyGoogle(context)),
          ],
        ),
      );
}
