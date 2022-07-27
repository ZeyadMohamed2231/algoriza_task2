import 'package:algoriza_task2/modules/schedule/presentation/widgets/ScheduleWidget.dart';
import 'package:algoriza_task2/shared/cubit/cubit.dart';
import 'package:algoriza_task2/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,  // Added
      child: BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit,AppStates> (
        listener: (BuildContext context,AppStates state) {} ,
    builder: (BuildContext context, AppStates state) {
      AppCubit cubit = AppCubit.get(context);
      return
        Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: const Text(
              'Schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            backgroundColor: Colors.white,
            elevation:1.0,

          ),
          body: const ScheduleWidget(),
        );
    },
        ),

      ),
    );
  }
}
