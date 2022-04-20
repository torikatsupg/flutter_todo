import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/model/task.dart';

const _name = 'name';
const _createdAt = 'createdAt';
const _isDone = 'isDone';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this.uid);

  final String uid;

  CollectionReference get _ref => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('tasks');

  @override
  Future<List<Task>> findAllTodo() async {
    // TODO(torikatsu): pagenation
    final result = await _ref.where(_isDone, isEqualTo: false).get();
    return result.docs.map(
      (e) {
        final data = e.data() as Map<String, dynamic>;
        return Task(
          id: e.id,
          name: data[_name],
          createdAt: (data[_createdAt] as Timestamp).toDate(),
          isDone: data[_isDone],
        );
      },
    ).toList();
  }

  @override
  Future<List<Task>> findAllDone() async {
    // TODO(torikatsu): pagenation
    final result = await _ref.where(_isDone, isEqualTo: true).get();
    return result.docs.map(
      (e) {
        final data = e.data() as Map<String, dynamic>;
        return Task(
          id: e.id,
          name: data[_name],
          createdAt: (data[_createdAt] as Timestamp).toDate(),
          isDone: data[_isDone],
        );
      },
    ).toList();
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
