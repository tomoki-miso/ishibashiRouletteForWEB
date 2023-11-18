import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/screens/auth/page/sign_in_confirm.dart';
import 'package:ishibashi/base.dart';
import 'package:ishibashi/firebase/firebase_options.dart';



final storeInfoProvider = FutureProvider.autoDispose(
    (ref) => FirebaseFirestore.instance.collection('stores').snapshots());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ユーザーが認証されている場合、BasePageに移動
      return const BasePage();
    } else {
      // ユーザーが認証されていない場合、ログイン画面を表示
      return SignInConfirmPage();
    }
  }
}
