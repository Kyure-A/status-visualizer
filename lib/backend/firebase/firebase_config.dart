import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCUlEJwHNZRfSC6iiI4ePDfgwYBg0zeRlI",
            authDomain: "dupdup-29133.firebaseapp.com",
            projectId: "dupdup-29133",
            storageBucket: "dupdup-29133.appspot.com",
            messagingSenderId: "85354437050",
            appId: "1:85354437050:web:c73f6fbbb28564ea942583"));
  } else {
    await Firebase.initializeApp();
  }
}
