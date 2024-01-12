import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.btnText,required this.onTap});
  final VoidCallback onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: ElevatedButton(
        onPressed:onTap,
        style:ElevatedButton.styleFrom(
            minimumSize:const Size(double.infinity, 50),
            backgroundColor:AppColor.secondaryColor,
            elevation:0
        ), 
        child:Text(
          btnText,
          style:const TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold  
          ),
        )
      ),
    );
  }
}