import 'package:algoriza_task2/modules/add_task/presentation/pages/AddTaskScreen.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/all_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/completed_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/favorites_tasks.dart';
import 'package:algoriza_task2/modules/board/presentation/widgets/un_completed_tasks.dart';
import 'package:algoriza_task2/modules/schedule/presentation/pages/ScheduleScreen.dart';
import 'package:algoriza_task2/shared/components/constants.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {



  HomeScreen({Key? key}) : super(key: key);

  // @override
  // void initState(){
  //   super.initState();
  //   createDatabase();
  // }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,  // Added
      initialIndex: 0,
      child: BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (BuildContext context,AppStates state) {} ,
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
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

                    cubit.changeIndex(index);

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
              body: ConditionalBuilder(
                condition: true,
                builder: (context) =>  cubit.screens[cubit.currentIndex],
                fallback: (context) => const Center(child: CircularProgressIndicator()),
              ),
              floatingActionButton: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: FloatingActionButton.extended(
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AddTaskScreen()),);
                    },
                    backgroundColor: Colors.green,
                    label: const Text(
                        'Add a Task'
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }




}
