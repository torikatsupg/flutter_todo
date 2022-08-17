import 'dart:developer';

void logError(e, sc) {
  log('unhandled error has occured',
      error: e, stackTrace: sc, name: 'flutter_todo', level: 2000);
}
