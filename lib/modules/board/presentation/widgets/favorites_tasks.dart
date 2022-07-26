import 'package:flutter/material.dart';

class FavoritesTasksWidget extends StatefulWidget {
  const FavoritesTasksWidget({Key? key}) : super(key: key);

  @override
  State<FavoritesTasksWidget> createState() => _FavoritesTasksWidgetState();
}

class _FavoritesTasksWidgetState extends State<FavoritesTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Favorites Task'));
  }
}
