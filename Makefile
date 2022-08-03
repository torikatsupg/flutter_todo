.PHONY: run
run: start_emulator
	flutter run

.PHONY: run_web_server
run_web_server:
	flutter run -d web-server

.PHONY: run_with_real_firebase
run_with_real_firebase:
	flutter run -d web-server --dart-define=USE_FIREBASE_EMULATOR=false
	
.PHONY: start_emulator
start_emulator:
	cd firebase && firebase emulators:start --import . --export-on-exit
