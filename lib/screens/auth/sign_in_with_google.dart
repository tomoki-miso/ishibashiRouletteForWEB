import 'package:google_sign_in/google_sign_in.dart';
import 'package:ishibashi/firebase/firebase_options.dart';

final GoogleSignIn googleLogin = GoogleSignIn(
  clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

// Googleサインインに関連する他のコード
