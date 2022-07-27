import 'package:algoriza_task2/modules/add_task/presentation/pages/AddTaskScreen.dart';
import 'package:algoriza_task2/modules/schedule/presentation/pages/ScheduleScreen.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (BuildContext context,AppStates state) {} ,
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            return DefaultTabController(
              length: 4,
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

                      cubit.changeIndex(index);

                    },
                    tabs: const [
                      Tab(child: FittedBox(child: Text('All',maxLines: 1, style: TextStyle(color: Colors.black,fontSize: 15),)) ),
                      Tab(child: Text('Complete', maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 15),) ),
                      Tab(child: Text('UnComp', maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 15),) ),
                      Tab(child: Text('Favorite', maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 15),) ),
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ScheduleScreen()),
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
              ),
            );
          },
        ),
      ),
    );
  }




}
