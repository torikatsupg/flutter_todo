import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/query_list.dart';
import 'package:flutter_todo/model/result.dart';

import 'package:flutter_todo/model/task.dart';

const _name = 'name';
const _createdAt = 'createdAt';
const _isDone = 'isDone';
const limit = 20;

class TaskRepositoryImpl implements TaskRepository<CursorImpl, FirestoreError> {
  TaskRepositoryImpl(this.uid);

  final String uid;

  CollectionReference get _ref => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('tasks');

  @override
  Future<Result<QueryList<Task, CursorImpl>, FirestoreError>> findAllTodo(
      [CursorImpl? cursor]) async {
    final query =
        _ref.where(_isDone, isEqualTo: false).orderBy(_createdAt).limit(limit);
    final cursorDoc = cursor?.value;
    try {
      final result = await (cursorDoc == null
              ? query
              : query.startAfterDocument(cursorDoc))
          .get();

      final items = result.docs.map(_toTask).toList();
      return Result.ok(
        QueryList(
          items,
          CursorImpl(result.docs.isEmpty ? null : result.docs.last),
          items.length == limit,
        ),
      );
    } on dynamic catch (e) {
      // TODO(torikatsu): handle firestore error.
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<QueryList<Task, CursorImpl>, FirestoreError>> findAllDone(
      [CursorImpl? cursor]) async {
    final query =
        _ref.where(_isDone, isEqualTo: true).orderBy(_createdAt).limit(limit);
    final cursorDoc = cursor?.value;
    try {
      final result = await (cursorDoc == null
              ? query
              : query.startAfterDocument(cursorDoc))
          .get();

      final items = result.docs.map(_toTask).toList();
      return Result.ok(
        QueryList(
          items,
          CursorImpl(result.docs.isEmpty ? null : result.docs.last),
          items.length == limit,
        ),
      );
    } on dynamic catch (e) {
      // TODO(torikatsu): handle firestore error.
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<Task?, FirestoreError>> findById(String id) async {
    try {
      final result = await _ref.doc(id).get();
      final data = result.data() as Map<String, dynamic>?;
      if (data == null) {
        // TODO(torikatsu): Result.errにする
        return Result.ok(null);
      } else {
        return Result.ok(
          Task(
            id: result.id,
            name: data[_name],
            createdAt: (data[_createdAt] as Timestamp).toDate(),
            isDone: data[_isDone],
          ),
        );
      }
    } on dynamic catch (e) {
      // TODO(torikatsu): handle firestore error.
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<Task, FirestoreError>> insert({required String name}) async {
    final id = _ref.doc().id;
    try {
      await _ref.doc(id).set(
        {
          _name: name,
          _createdAt: Timestamp.now(),
          _isDone: false,
        },
        SetOptions(merge: false),
      );
      final result = await _ref.doc(id).get();
      return Result.ok(_toTask(result));
    } on dynamic catch (e) {
      // TODO(torikatsu): handle firestore error.
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<void, FirestoreError>> update(Task task) async {
    try {
      await _ref.doc(task.id).set(
        {
          _name: task.name,
          _createdAt: task.createdAt,
          _isDone: task.isDone,
        },
        SetOptions(merge: true),
      );
      return Result.ok(null);
    } on dynamic catch (e) {
      // TODO(torikatsu): handle firestore error.
      return Result.err(FirestoreError.error);
    }
  }

  Task _toTask(DocumentSnapshot<Object?> doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      name: data[_name],
      createdAt: (data[_createdAt] as Timestamp).toDate(),
      isDone: data[_isDone],
    );
  }
}
