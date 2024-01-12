import 'package:flutter/material.dart';
import './../styles/styles.dart';

class CustomTextField extends StatelessWidget {
 
  const CustomTextField({super.key,required this.controller,required this.placeHolder});

  final TextEditingController controller;
  
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller:controller,
        validator: (value){
               if(value==null || value.isEmpty){
                   return "Enter your $placeHolder";
               }
               return null;
        },
        cursorColor:AppColor.cursorColor,
        decoration: InputDecoration(
            hintText:placeHolder,
            // Outline border gives the border in outline
            border:
              const OutlineInputBorder(borderSide: BorderSide(color: AppColor.cursorColor)),
            // focus border only apply's when we click the TextFeildForm
            focusedBorder:
               const  OutlineInputBorder(borderSide: BorderSide(color: AppColor.cursorColor))),
      );
  }
}
