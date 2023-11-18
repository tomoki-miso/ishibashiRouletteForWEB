import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/screens/auth/page/after_sign_out.dart';
import 'package:ishibashi/screens/auth/signin/sign_in_with_google.dart';
import 'package:ishibashi/style/colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: ColorName.greyBase, size: 40),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 14),
              child: SizedBox(
                height: 60,
                child: Image.asset('assets/images/iconKari.png'),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _logOut(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43.5),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> _logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn?.signOut();
    
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AfterSignOutPage(), // 何も表示されないページに遷移してアプリを一旦閉じさせる
      ),
    );
  }
}
