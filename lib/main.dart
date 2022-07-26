import 'package:algoriza_task2/modules/board/presentation/pages/home_screen.dart';
import 'package:algoriza_task2/shared/Bloc_Observer.dart';
import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}



