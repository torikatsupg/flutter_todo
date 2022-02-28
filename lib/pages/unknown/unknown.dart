import 'package:flutter/material.dart';
import 'package:flutter_todo/component/navigate_buttons.dart';

MaterialPage createUnknownPage() {
  return const MaterialPage(
    child: _Unknown(),
  );
}

class _Unknown extends StatelessWidget {
  const _Unknown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('unknown'),
      ),
      body: Center(
        child: Column(
          children: const [
            NavigateButtons(),
            Text('unknown'),
          ],
        ),
      ),
    );
  }
}
