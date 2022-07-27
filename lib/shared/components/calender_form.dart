

import 'package:flutter/material.dart';

class MyCalender extends StatelessWidget {
  final String dayNu;
  final String dayTex;
  final GestureTapCallback? onTap;
  final Color? txtColor;
  final Color? conColor;

  const MyCalender({Key? key, required this.dayNu, required this.dayTex,required this.onTap, this.txtColor, this.conColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15.0,),
              color: conColor,
          ),
          width: 40,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(dayNu,style: TextStyle(color: txtColor),),
              const SizedBox(height: 5,),
              Text(dayTex,style: TextStyle(color: txtColor),),
            ],
          ),
        ),
      ),
    );
  }
}
