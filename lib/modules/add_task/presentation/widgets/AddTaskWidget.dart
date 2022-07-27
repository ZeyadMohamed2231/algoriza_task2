import 'package:algoriza_task2/modules/board/presentation/pages/home_screen.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/all_tasks.dart';
import 'package:algoriza_task2/shared/components/constants.dart';
import 'package:algoriza_task2/shared/components/form.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


class AddTaskWidget extends StatelessWidget {

String dropdownValue = 'One';


final items = ['1 day before',  '1 hour before',  '30 min before',  '10 min before','nothing'];

final itemsRepeat = ['Weekly',  'Daily', 'nothing'];

  AddTaskWidget({Key? key}) : super(key: key);



DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  value: item,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      item,
      style: const TextStyle(
          color: Colors.grey,
          fontSize: 15
      ),
    ),
  ),
);









@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state) {} ,
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),

                    ),
                  ),
                ),
                MyForm(
                    height: 50,
                    width: double.infinity,
                    controller: cubit.title,
                    textInputType: TextInputType.text,
                    labelText: 'Design Team Meeting'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: Colors.grey[200]
                      ),
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: cubit.date,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2029-07-26'),
                          ).then((value) {
                            cubit.getDate(value!);
                            // cubit.getDataTextFormField(date: )
                            // setState(() {
                            //   date.text = DateFormat.yMMMd().format(value!);
                            // });
                            debugPrint(cubit.date.text);
                          });
                        },
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            floatingLabelBehavior: FloatingLabelBehavior.never,

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.0),
                            ),
                            labelText: '12/26/2022',
                            labelStyle: TextStyle(
                                fontSize: 15.0
                            ),
                            border: OutlineInputBorder(
                            )
                        ),
                      )
                    //         Row(
                    //           children:  [
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 15.0),
                    //               child: TextButton(
                    //                   child: Text(
                    //                   finalDate,
                    //                   style: const TextStyle(
                    //                       color: Colors.grey
                    //                   ),
                    //                   ),
                    //                 onPressed: (){
                    //                   DatePicker.showDatePicker(context,
                    //                       showTitleActions: true,
                    //                       minTime: DateTime(2022, 3, 5),
                    //                       maxTime: DateTime(2030, 6, 7), onChanged: (finalDate) {
                    //                         debugPrint('change $finalDate');
                    //                       }, onConfirm: (finalDate) {
                    //                         debugPrint('confirm $finalDate');
                    //                       }, currentTime: DateTime.now(), locale: LocaleType.en
                    //                   );
                    //                 },
                    //               ),
                    //             ),
                    //             const SizedBox(width: 200,),
                    //             IconButton(
                    //               icon:const Icon(Icons.arrow_drop_down)
                    //                 , onPressed: () {
                    //               DatePicker.showDatePicker(context,
                    //                   showTitleActions: true,
                    //                   minTime: DateTime(2022, 3, 5),
                    //                   maxTime: DateTime(2030, 6, 7), onChanged: (finalDate) {
                    //                     debugPrint('change $finalDate');
                    //                   }, onConfirm: (finalDate) {
                    //                     debugPrint('confirm $finalDate');
                    //                   }, currentTime: DateTime.now(), locale: LocaleType.en
                    //               );
                    //             },
                    //             )
                    //           ],
                    // )
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Start Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(width: 50,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'End Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0
                              ),

                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: Colors.grey[200]
                        ),
                        width: 140,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: cubit.startTime);
                                if (newTime == null) return;
                                cubit.getStartTime(newTime);
                              },
                              child: Text(
                                '${cubit.startTime.hour}:${cubit.startTime
                                    .minute} ${cubit.startTime.period.name
                                    .toUpperCase()}',
                                style: const TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            IconButton(onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: cubit.startTime);
                              if (newTime == null) return;
                              cubit.getStartTime(newTime);
                            },
                                icon: const Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.grey,

                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: Colors.grey[200]
                        ),
                        width: 140,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: cubit.endTime);
                                if (newTime == null) return;
                                cubit.getEndTime(newTime);
                              },
                              child: Text(
                                '${cubit.endTime.hour}:${cubit.endTime
                                    .minute} ${cubit.endTime.period.name
                                    .toUpperCase()}',
                                style: const TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            IconButton(onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: cubit.endTime);
                              if (newTime == null) return;
                              cubit.getEndTime(newTime);
                            },
                                icon: const Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.grey,

                                )
                            ),

                          ],
                        ),

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Remind',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[200]
                    ),
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            '1 day before'
                        ),
                      ),
                      isExpanded: true,
                      value: cubit.value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => cubit.getValue(value!),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Repeat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[200]
                    ),
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Weekly'
                        ),
                      ),
                      isExpanded: true,
                      value: cubit.valueRepeat,
                      items: itemsRepeat.map(buildMenuItem).toList(),
                      onChanged: (value) =>
                          cubit.getValueRe(value!),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        debugPrint(cubit.title.text);
                        debugPrint(cubit.date.text);
                        if (cubit.title.text.isEmpty ||
                            cubit.date.text.isEmpty || cubit.startTime
                            .toString()
                            .isEmpty || cubit.endTime
                            .toString()
                            .isEmpty || cubit.value
                            .toString()
                            .isEmpty || cubit.valueRepeat
                            .toString()
                            .isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter All values")));
                        } else {
                          cubit.changeScreens();


                        }
                      },
                      backgroundColor: Colors.green,
                      label: const Text(
                          'Create a Task'
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
    ),
  );

  }

//   void createDatabase() async {
//       database = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database,version){
//         debugPrint('database created');
//         database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, start_time TEXT, end_time TEXT, remind TEXT, repeat TEXT, status TEXT)').then((value) {
//           debugPrint('Table Created');
//         }).catchError((error){
//           debugPrint('Error while creating Table ${error.toString()}');
//         });
//       },
//       onOpen: (database)
//       {
//         // delete(database);
//         debugPrint('database opened');
//         getDataFromDatabase(database).then((value)
//         {
//           tasks = value;
//         });
//       }
//   );
// }
//   Future insertToDatabase({required String title, required String date, required String startTime, required String endTime, required String remind, required String repeat, required String status}) async{
//   return await database.transaction((txn) => txn.rawInsert(
//       'INSERT INTO tasks(title, date, start_time, end_time, remind, repeat, status) VALUES ("$title","$date","$startTime","$endTime","$remind","$repeat","$status")')
//       .then((value) {
//     debugPrint('$value inserted successfully');
//   }).catchError((error){
//     debugPrint('Error while Inserting New Record Table ${error.toString()}');
//   }));
// }
//   Future<List<Map>> getDataFromDatabase(database) async {
//       return await database.rawQuery('SELECT * FROM tasks');
//
//     }
//   void delete(database) async {
//    await database.rawDelete('DELETE FROM tasks ');
// }
}
