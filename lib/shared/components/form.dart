import 'package:flutter/material.dart';

class MyForm extends StatelessWidget{

  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final double width;
  final double height;

  const MyForm({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.width,
    required this.height
  }) : super(key: key);





  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(15.0,),
            color: Colors.grey[200]
        ),
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,

              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
              ),
              labelText: labelText,
              labelStyle: const TextStyle(
                  fontSize: 15.0
              ),
              border: OutlineInputBorder(


              )
          ),

        ),
      ),
    );
  }
  
}