import 'package:flutter/material.dart';

enum PageStorageKies {
  todoTab("todo_tab"),
  doneTab("done_tab");

  const PageStorageKies(this._key);
  final String _key;
  PageStorageKey<String> get key => PageStorageKey(_key);
}
