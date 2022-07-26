import 'package:flutter/material.dart';

class AllTasksWidget extends StatefulWidget {
  const AllTasksWidget({Key? key}) : super(key: key);

  @override
  State<AllTasksWidget> createState() => _AllTasksWidgetState();
}

class _AllTasksWidgetState extends State<AllTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('All Task'));
  }
}
