import 'package:algoriza_task2/modules/schedule/presentation/widgets/ScheduleWidget.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  int currentIndex = 0;
  Color dayColor = Colors.black;
  Color conColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,  // Added
      initialIndex: 0,
      child: Scaffold(
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
          elevation: 1.0,
          // bottom: TabBar(
          //
          //   onTap: (index){
          //     setState((){
          //       currentIndex = index;
          //
          //     });
          //   },
          //   tabs:  [
          //     TextButton(
          //       onPressed: () {
          //
          //       },
          //       child: Text(
          //         'Sun',
          //         style: TextStyle(
          //           color: dayColor,
          //
          //         ),
          //         maxLines: 1,
          //
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0,),
          //         color: conColor,
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text(
          //           'Mon',
          //           style: TextStyle(
          //             color: dayColor,
          //           ),
          //         ),),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0,),
          //           color: conColor
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text(
          //           'Tue',
          //           style: TextStyle(
          //             color: dayColor,
          //           ),
          //         ),),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0,),
          //           color: conColor
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text('Wed',style: TextStyle(
          //           color: dayColor,
          //         ),),),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0,),
          //           color: conColor
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text('Thu',style: TextStyle(
          //           color: dayColor,
          //         ),),),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0,),
          //           color: conColor
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text('Fri',style: TextStyle(
          //           color: dayColor,
          //         ),),),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0,),
          //           color:conColor
          //       ),
          //       width: 50,
          //       height: 50,
          //       child: TextButton(
          //         onPressed: () {
          //
          //         },
          //         child:  Text('Sat',style: TextStyle(
          //           color: dayColor,
          //         ),),),
          //     )
          //   ],
          // ),
        ),
        body: const ScheduleWidget(),
      ),
    );
  }
}
