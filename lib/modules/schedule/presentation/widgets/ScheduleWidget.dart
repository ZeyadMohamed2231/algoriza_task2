

import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';


class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  int currentIndex = 0;
  List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek(
        "Tue",
        isSelected: true
    ),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
    DayInWeek(
      "Sat",
    ),
  ];

  Color dayColor = Colors.black;
  Color conColor = Colors.white;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectWeekDays(
              fontSize:14,
              fontWeight: FontWeight.w500,
              days: _days,
              daysFillColor: Colors.green,
              selectedDayTextColor: Colors.white,
              unSelectedDayTextColor: Colors.black,
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient:  const LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.white,Colors.white],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              onSelect: (values) { // <== Callback to handle the selected days
                print(values);
              },
            ),
          ),
        ),
        // Row(
        //   children:  [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10.0,),
        //             color: conColor
        //         ),
        //         width: 50,
        //         height: 50,
        //         child: TextButton(
        //           onPressed: () {
        //
        //
        //           },
        //         child: Text(
        //             'Sun',
        //           style: TextStyle(
        //             color: dayColor,
        //           ),
        //         ),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0,),
        //           color: conColor,
        //       ),
        //       width: 50,
        //       height: 50,
        //       child: TextButton(
        //         onPressed: () {
        //
        //         },
        //         child:  Text(
        //             'Mon',
        //           style: TextStyle(
        //             color: dayColor,
        //           ),
        //         ),),
        //     ),
        //     const SizedBox(width: 5,),
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
        //             'Tue',
        //           style: TextStyle(
        //             color: dayColor,
        //           ),
        //         ),),
        //     ),
        //     const SizedBox(width: 5,),
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
        //     const SizedBox(width: 5,),
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
        //     const SizedBox(width: 5,),
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
        //     const SizedBox(width: 5,),
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
        //     ),
        //
        //   ],
        // )

      ],
    );
  }
}
