import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todo/util/env.dart';
import 'package:flutter_todo/util/logger.dart';

const _localhost = 'localhost';
const firestorePort = 8080;
const authPort = 9099;

Future<void> initializeFirebase() async {
  if (_isInitialized()) return;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  if (Env.isEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator(_localhost, firestorePort);
    await Future.wait(
      [FirebaseAuth.instance.useAuthEmulator(_localhost, authPort)],
    );
  }
}

bool _isInitialized() {
  try {
    return Firebase.apps.isNotEmpty;
  } on dynamic catch (e, sc) {
    logError(e, sc);
    return false;
  }
}
