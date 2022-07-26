import 'package:flutter/material.dart';

class UnCompletedTasksWidget extends StatefulWidget {
  const UnCompletedTasksWidget({Key? key}) : super(key: key);

  @override
  State<UnCompletedTasksWidget> createState() => _UnCompletedTasksWidgetState();
}

class _UnCompletedTasksWidgetState extends State<UnCompletedTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Un Completed Task'));
  }
}
