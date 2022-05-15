class Env {
  static const isEmulator =
      bool.fromEnvironment('USE_FIREBASE_EMULATOR', defaultValue: true);
}
