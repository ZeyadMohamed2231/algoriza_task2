

// List<Map> tasks = [];
// late Database database;
// void createDatabase() async {
//   database = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database,version){
//         print('database created');
//         database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, start_time TEXT, end_time TEXT, remind TEXT, repeat TEXT, status TEXT)').then((value) {
//           print('Table Created');
//         }).catchError((error){
//           print('Error while creating Table ${error.toString()}');
//         });
//       },
//       onOpen: (database)
//       {
//         // delete(database);
//         print('database opened');
//         getDataFromDatabase(database).then((value)
//         {
//           tasks = value;
//         });
//       }
//   );
// }
// Future insertToDatabase({required String title, required String date, required String startTime, required String endTime, required String remind, required String repeat, required String status}) async{
//   return await database.transaction((txn) => txn.rawInsert(
//       'INSERT INTO tasks(title, date, start_time, end_time, remind, repeat, status) VALUES ("$title","$date","$startTime","$endTime","$remind","$repeat","$status")')
//       .then((value) {
//     print('$value inserted successfully');
//   }).catchError((error){
//     print('Error while Inserting New Record Table ${error.toString()}');
//   }));
// }
// Future<List<Map>> getDataFromDatabase(database) async {
//   return await database.rawQuery('SELECT * FROM tasks');
//
// }
// void delete(database) async {
//   await database.rawDelete('DELETE FROM tasks ');
// }