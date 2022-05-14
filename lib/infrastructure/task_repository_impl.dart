import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_todo/model/task.dart';

const _name = 'name';
const _createdAt = 'createdAt';
const _isDone = 'isDone';

// TODO(torikatsu): 置き場所
class CursorImpl extends Cursor {
  CursorImpl(this.value);
  DocumentSnapshot value;
}

class TaskRepositoryImpl implements TaskRepository<CursorImpl> {
  TaskRepositoryImpl(this.uid);

  final String uid;

  CollectionReference get _ref => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('tasks');

  @override
  Future<QueryList<Task, CursorImpl>> findAllTodo([CursorImpl? cursor]) async {
    final query = _ref.where(_isDone, isEqualTo: false).limit(20);
    final result =
        await (cursor == null ? query : query.startAfterDocument(cursor.value))
            .get();

    return QueryList(
      result.docs.map(
        (e) {
          final data = e.data() as Map<String, dynamic>;
          return Task(
            id: e.id,
            name: data[_name],
            createdAt: (data[_createdAt] as Timestamp).toDate(),
            isDone: data[_isDone],
          );
        },
      ).toList(),
      CursorImpl(result.docs.last),
    );
  }

  @override
  Future<QueryList<Task, CursorImpl>> findAllDone([CursorImpl? cursor]) async {
    final query = _ref.where(_isDone, isEqualTo: true).limit(20);
    final result =
        await (cursor == null ? query : query.startAfterDocument(cursor.value))
            .get();

    return QueryList(
      result.docs.map(
        (e) {
          final data = e.data() as Map<String, dynamic>;
          return Task(
            id: e.id,
            name: data[_name],
            createdAt: (data[_createdAt] as Timestamp).toDate(),
            isDone: data[_isDone],
          );
        },
      ).toList(),
      CursorImpl(result.docs.last),
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
  Future<void> insert({required String name}) async {
    await _ref.doc(_ref.doc().id).set(
      {
        _name: name,
        _createdAt: Timestamp.now(),
        _isDone: false,
      },
      SetOptions(merge: false),
    );
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
}
