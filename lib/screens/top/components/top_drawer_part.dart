import 'package:flutter/material.dart';
import 'package:ishibashi/screens/top/page/top_dawer_form_page.dart';
import 'package:ishibashi/screens/top/page/top_drawer_inquiry.dart';
import 'package:ishibashi/screens/top/page/top_drawer_manual.dart';
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
            color: ColorName.primarySecondary,
          ),
          child: Text('Information',style: Styles.DrawerTitle,),
        ),
        ListTile(
          title: const Text('アプリの使い方',style: Styles.DrawerSubTitle,),
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
          title: const Text('お問い合わせ',style: Styles.DrawerSubTitle,),
           onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  TopDrawerInquiryPage(),
                    ),
                  );
                },
        ),
         ListTile(
          title: const Text('ご意見・お問い合わせ',style: Styles.DrawerSubTitle,),
         onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const TopDrawerFormPage(),
                    ),
                  );
                },
        ),
            ],
          ),
        );
}