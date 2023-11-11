import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  try {
    //Google認証フローを起動する
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //リクエストから認証情報を取得する
    final googleAuth = await googleUser?.authentication;
    //firebaseAuthで認証を行う為、credentialを作成
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //作成したcredentialを元にfirebaseAuthで認証を行う
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.additionalUserInfo!.isNewUser) {
      //新規ユーザーの場合の処理
    } else {
      //既存ユーザーの場合の処理
    }
  } on FirebaseException catch (e) {
    print(e.message);
  } catch (e) {
    print(e);
  }
}
