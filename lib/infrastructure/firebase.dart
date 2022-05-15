import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todo/util/env.dart';

const _localhost = 'localhost';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (Env.isEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator(_localhost, 8080);
    await Future.wait<dynamic>(
      [FirebaseAuth.instance.useAuthEmulator(_localhost, 9099)],
    );
  }
}
