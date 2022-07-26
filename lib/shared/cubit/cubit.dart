import 'package:algoriza_task2/modules/board/presentation/widgets/all_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/completed_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/favorites_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/un_completed_tasks.dart';

import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget> screens = [
     AllTasksWidget(),
    const CompletedTasksWidget(),
    const UnCompletedTasksWidget(),
    const FavoritesTasksWidget()
  ];


  void changeIndex(int index)
  {
  currentIndex = index;
  emit(AppChangeScreenState());
  }
  List<Map> tasks = [];
  Database? database;

  void createDatabase()  {
    openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version){
          print('database created');
          database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, start_time TEXT, end_time TEXT, remind TEXT, repeat TEXT, status TEXT)').then((value) {
            print('Table Created');
          }).catchError((error){
            print('Error while creating Table ${error.toString()}');
          });
        },
        onOpen: (database)
        {
          // delete(database);
          print('database opened');
          getDataFromDatabase(database).then((value)
          {
            tasks = value;
            print(tasks);
            emit(AppGetDatabaseState());
          });
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }
     insertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String remind,
    required String repeat,
    required String status}) async{
       await database?.transaction((txn) => txn.rawInsert(
        'INSERT INTO tasks(title, date, start_time, end_time, remind, repeat, status) VALUES ("$title","$date","$startTime","$endTime","$remind","$repeat","$status")')
        .then((value) {
      print('$value inserted successfully');
      emit(AppInsertDatabaseState());
      getDataFromDatabase(database).then((value)
      {
        tasks = value;
        print(tasks);
        emit(AppGetDatabaseState());
      });
    }).catchError((error){
      print('Error while Inserting New Record Table ${error.toString()}');
    }));
  }
  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');

  }
  void delete(database) async {
    await database.rawDelete('DELETE FROM tasks ');
  }

  var  title= TextEditingController();
  var  date=TextEditingController();
  String? value;
  String? valueRepeat;
  TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 30);
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 30);


  void getDate(DateTime value){
    date.text = DateFormat.yMMMd().format(value);
    emit(AppGetDate());
  }

  void getStartTime(TimeOfDay newTime){
    startTime = newTime;
    emit(AppGetStartTime());
  }

  void getEndTime(TimeOfDay newTime){
    endTime = newTime;
    emit(AppGetEndTime());
  }

  void getValue(String value){
    this.value = value;
    emit(AppGetValue());
  }

  void getValueRe(String value){
    valueRepeat = value;
    emit(AppGetValueRep());
  }

//   void getDataTextFormField({
//      TextEditingController? title,
//      TextEditingController? date,
//      String? value,
//      String? valueRepeat,
//      TimeOfDay? endTime,
//      TimeOfDay? startTime,
// }){
//     this.title = title!;
//     this.date = date!;
//     this.value = value;
//     this.valueRepeat = valueRepeat;
//     this.endTime = endTime!;
//     this.startTime = startTime!;
//
//     emit(AppChangeTextFormFields());
//   }

}