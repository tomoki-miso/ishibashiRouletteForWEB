import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/features/top/components/top_delete_account_alert_dialog.dart';
import 'package:ishibashi/features/top/components/top_sign_out_alert_dialog.dart';
import 'package:ishibashi/features/top/page/top_dawer_form_page.dart';
import 'package:ishibashi/features/top/page/top_drawer_inquiry.dart';
import 'package:ishibashi/features/top/page/top_drawer_manual.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class TopDrawerPart extends StatelessWidget {
  const TopDrawerPart({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: ColorName.backGroundYellow,
              ),
              child: Text(
                'Information',
                style: Styles.drawerTitle,
              ),
            ),
            ListTile(
              title: const Text(
                'アプリの使い方',
                style: Styles.drawerSubTitle,
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopDrawerManualPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'お問い合わせ',
                style: Styles.drawerSubTitle,
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopDrawerInquiryPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'ご意見・お問い合わせ',
                style: Styles.drawerSubTitle,
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopDrawerFormPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'ログアウト',
                style: Styles.drawerSubTitle,
              ),
              onTap: () async {
                await showCupertinoDialog(
                  context: context,
                  builder: (context) => const TopSignOutAlertDialog(),
                );
              },
            ),
            ListTile(
              title: const Text(
                '退会',
                style: Styles.drawerSubTitle,
              ),
              onTap: () async {
                await showCupertinoDialog(
                  context: context,
                  builder: (context) => const TopDeleteAccountAlertDialog(),
                );
              },
            ),
          ],
        ),
      );
}
