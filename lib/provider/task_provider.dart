import 'package:flutter_todo/model/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoTaskProvider = FutureProvider<List<TodoTask>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return <TodoTask>[
    TodoTask(id: '00', name: 'todo-00'),
    TodoTask(id: '01', name: 'todo-01'),
    TodoTask(id: '02', name: 'todo-02'),
    TodoTask(id: '03', name: 'todo-03'),
    TodoTask(id: '04', name: 'todo-04'),
    TodoTask(id: '05', name: 'todo-05'),
    TodoTask(id: '06', name: 'todo-06'),
    TodoTask(id: '07', name: 'todo-07'),
    TodoTask(id: '08', name: 'todo-08'),
    TodoTask(id: '09', name: 'todo-09'),
    TodoTask(id: '10', name: 'todo-10'),
    TodoTask(id: '11', name: 'todo-11'),
    TodoTask(id: '12', name: 'todo-12'),
    TodoTask(id: '13', name: 'todo-13'),
    TodoTask(id: '14', name: 'todo-14'),
    TodoTask(id: '15', name: 'todo-15'),
    TodoTask(id: '16', name: 'todo-16'),
    TodoTask(id: '17', name: 'todo-17'),
    TodoTask(id: '18', name: 'todo-18'),
  ];
});

final doneTaskProvider = FutureProvider<List<DoneTask>>((ref) {
  return <DoneTask>[
    DoneTask(id: '0', name: 'done-00'),
    DoneTask(id: '1', name: 'done-01'),
    DoneTask(id: '2', name: 'done-02'),
    DoneTask(id: '3', name: 'done-03'),
    DoneTask(id: '4', name: 'done-04'),
    DoneTask(id: '5', name: 'done-05'),
    DoneTask(id: '6', name: 'done-06'),
    DoneTask(id: '7', name: 'done-07'),
    DoneTask(id: '8', name: 'done-08'),
    DoneTask(id: '9', name: 'done-09'),
  ];
});
