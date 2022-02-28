import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';

class TodoTab extends StatelessWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          NavigateButtons(),
          Text('TODO'),
        ],
      ),
    );
  }
}
