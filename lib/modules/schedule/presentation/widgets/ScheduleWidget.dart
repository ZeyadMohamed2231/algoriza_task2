
import 'dart:math';

import 'package:algoriza_task2/shared/components/calender_form.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



bool marked = true;

List<Map> tasks = [];



class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context,AppStates state) {} ,
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);

















        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children:  [
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '31', dayTex: 'Sun',onTap: (){
                    tasks = cubit.sunTasks;
                    cubit.changeDays('sun');
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '1', dayTex: 'Mon',onTap: (){
                    tasks = cubit.munTasks;
                    cubit.changeDays('mon');
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '2', dayTex: 'Tue',onTap: (){
                    cubit.changeDays('tue');
                    tasks = cubit.tueTasks;
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '3', dayTex: 'Wed',onTap: (){
                    cubit.changeDays('wed');
                    tasks = cubit.wedTasks;
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '28', dayTex: 'Thu',onTap: (){
                    cubit.changeDays('thu');
                    tasks = cubit.thuTasks;
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '29', dayTex: 'Fri',onTap: (){
                    cubit.changeDays('fri');
                    tasks = cubit.friTasks;
                  },),
                  MyCalender(conColor: Colors.green, txtColor: Colors.white,dayNu: '30', dayTex: 'Sat',onTap: (){
                    cubit.changeDays('sat');
                    tasks = cubit.satTasks;
                  },),
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[500],
              ),
              const SizedBox(width: 10,),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index) => buildScheduleItem(cubit,tasks[index]),
                  separatorBuilder: (context,index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: tasks.length
              ),

            ],
          ),
        );
      },
    );
  }


  Widget buildScheduleItem(AppCubit cubit,Map model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(15.0,),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
      ),
      width: double.infinity,
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('${model['start_time'].toString().substring(10,15)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),),
                  const SizedBox(height: 5,),
                  Text('${model['title']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.check_circle,color: Colors.white))


        ],
      ),
    ),
  );


  
}
