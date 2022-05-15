import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/model/query_list.dart';

class CursorImpl extends Cursor {
  CursorImpl(this.value);
  DocumentSnapshot? value;
}