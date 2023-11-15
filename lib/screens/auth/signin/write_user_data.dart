import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> writeUserData(String email, String password) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;

    if (user != null) {
      // 新しいユーザーがサインアップした場合、Firestoreにデータを書き込む
      await firestore.collection('users').doc(user.uid).set({
        'email': email,
        'uid':user.uid,
      });
    }
  } catch (e) {
    print('サインアップ中にエラーが発生しました: $e');
    // エラー処理
  }
}
