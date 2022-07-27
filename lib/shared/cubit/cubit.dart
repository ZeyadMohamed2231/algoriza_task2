

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

  var  title= TextEditingController();
  var  date=TextEditingController();
  String? value;
  String? valueRepeat;
  TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 30);
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 30);

  List<Widget> screens = [
    const AllTasksWidget(),
    const CompletedTasksWidget(),
    const UnCompletedTasksWidget(),
    const FavoritesTasksWidget()
  ];

  List<Map> allTasks = [];
  List<Map> compTasks = [];
  List<Map> unCompTasks = [];
  List<Map> favTasks = [];
  List<Map> sunTasks = [];
  List<Map> munTasks = [];
  List<Map> tueTasks = [];
  List<Map> wedTasks = [];
  List<Map> thuTasks = [];
  List<Map> friTasks = [];
  List<Map> satTasks = [];



  Database? database;

  void changeIndex(int index)
  {

  currentIndex = index;
  emit(AppChangeScreenState());
  database!.close();
  createDatabase();

  }


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
          getDataFromDatabase(database);
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
      getDataFromDatabase(database);
    }).catchError((error){
      print('Error while Inserting New Record Table ${error.toString()}');
    }));
  }


  void getDataFromDatabase(database)  {

    allTasks = [];
    compTasks = [];
    unCompTasks = [];
    favTasks = [];
    sunTasks = [];
    munTasks = [];
    tueTasks = [];
    wedTasks = [];
    thuTasks = [];
    friTasks = [];
    satTasks = [];

    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value){
       value.forEach((element) {
         if(element['status'] == 'All'){
          allTasks.add(element);
         }
         if(element['status'] == 'Completed'){
           allTasks.add(element);
           compTasks.add(element);

         }
         if(element['status'] == 'UnCompleted'){
           allTasks.add(element);
           unCompTasks.add(element);
         }
         if(element['status'] == 'Favorite'){
           allTasks.add(element);
           favTasks.add(element);
         }
         if(element['date'].toString().contains("28")){
           thuTasks.add(element);
         }
         if(element['date'].toString().contains("29")){
           friTasks.add(element);
         }
         if(element['date'].toString().contains("30")){
           satTasks.add(element);
         }
         if(element['date'].toString().contains("31")){
           sunTasks.add(element);
         }
         if(element['date'].toString().contains("1")){
           munTasks.add(element);
         }
         if(element['date'].toString().contains("2")){
           tueTasks.add(element);
         }
         if(element['date'].toString().contains("3")){
           wedTasks.add(element);
         }
       });
       emit(AppGetDatabaseState());
     });

  }
  void delete(database) async {
    await database.rawDelete('DELETE FROM tasks ');
  }

  void deleteTask({
  required int id })
  async{
    database!.rawDelete('DELETE FROM tasks WHERE id = ?',[id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
  }
      ) async{
    database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',[status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }



  void changeScreens(){
    insertToDatabase(title: title.text, date: date.text, startTime: startTime.toString(), endTime: endTime.toString(), remind: value.toString(), repeat: valueRepeat.toString(), status: 'All');
    emit(AppChangeScreenGetDataBase());
  }

   closingRefDataBase() async{
    await database!.close();
    createDatabase();
    emit(AppCloseRefresh());
  }


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



  //Schedule Cubit


  late String days;

  void changeDays(days){
    this.days = days;
    print(days);
    emit(AppChangeDay());
    database!.close();
    createDatabase();
  }




}