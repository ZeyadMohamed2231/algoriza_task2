import 'package:algoriza_task2/modules/add_task/presentation/pages/AddTaskScreen.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/all_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/completed_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/favorites_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/un_completed_tasks.dart';
import 'package:algoriza_task2/modules/schedule/presentation/pages/ScheduleScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;



  List<Widget> screens = [
    const AllTasksWidget(),
    const CompletedTasksWidget(),
    const UnCompletedTasksWidget(),
    const FavoritesTasksWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,  // Added
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Board',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
         backgroundColor: Colors.white,
          elevation: 1.0,
          
          bottom: TabBar(
            onTap: (index){
              setState((){
                currentIndex = index;
              });
            },
            tabs: const [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  maxLines: 1,

                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Completed',
                  style: TextStyle(
                      color: Colors.black
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'UnCompleted',
                  style: TextStyle(
                      color: Colors.black,
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Favorite',
                  style: TextStyle(
                      color: Colors.black
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScheduleScreen()),
              );

            }, icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.calendar_month,
                size: 20.0,
                color: Colors.white,
              ),
            )),
          ],
        ),
        body: screens[currentIndex],
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: FloatingActionButton.extended(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskScreen()),);
              },
              backgroundColor: Colors.green,
              label: const Text(
                'Add a Task'
              ),
            ),
          ),
        ),







      ),
    );
  }
}
