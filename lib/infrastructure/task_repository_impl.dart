import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/infrastructure/cursor_impl.dart';
import 'package:flutter_todo/model/query_list.dart';

import 'package:flutter_todo/model/task.dart';

const _name = 'name';
const _createdAt = 'createdAt';
const _isDone = 'isDone';
const limit = 20;


class TaskRepositoryImpl implements TaskRepository<CursorImpl> {
  TaskRepositoryImpl(this.uid);

  final String uid;

  CollectionReference get _ref => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('tasks');

  @override
  Future<QueryList<Task, CursorImpl>> findAllTodo([CursorImpl? cursor]) async {
    final query = _ref.where(_isDone, isEqualTo: false).limit(limit);
    final cursorDoc = cursor?.value;
    final result =
        await (cursorDoc == null ? query : query.startAfterDocument(cursorDoc))
            .get();

    final items = result.docs.map(_toTask).toList();
    return QueryList(
      items,
      CursorImpl(result.docs.isEmpty ? null : result.docs.last),
      items.length == limit,
    );
  }

  @override
  Future<QueryList<Task, CursorImpl>> findAllDone([CursorImpl? cursor]) async {
    final query = _ref.where(_isDone, isEqualTo: true).limit(limit);
    final cursorDoc = cursor?.value;
    final result =
        await (cursorDoc == null ? query : query.startAfterDocument(cursorDoc))
            .get();

    final items = result.docs.map(_toTask).toList();
    return QueryList(
      items,
      CursorImpl(result.docs.isEmpty ? null : result.docs.last),
      items.length == limit,
    );
  }

  @override
  Future<Task?> findById(String id) async {
    final result = await _ref.doc(id).get();
    final data = result.data() as Map<String, dynamic>?;
    if (data == null) {
      return null;
    } else {
      return Task(
        id: result.id,
        name: data[_name],
        createdAt: (data[_createdAt] as Timestamp).toDate(),
        isDone: data[_isDone],
      );
    }
  }

  @override
  Future<Task> insert({required String name}) async {
    final id = _ref.doc().id;
    await _ref.doc(id).set(
      {
        _name: name,
        _createdAt: Timestamp.now(),
        _isDone: false,
      },
      SetOptions(merge: false),
    );
    final result = await _ref.doc(id).get();
    return _toTask(result);
  }

  @override
  Future<void> update(Task task) async {
    await _ref.doc(task.id).set(
      {
        _name: task.name,
        _createdAt: task.createdAt,
        _isDone: task.isDone,
      },
      SetOptions(merge: true),
    );
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
