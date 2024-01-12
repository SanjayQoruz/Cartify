import 'package:flutter/material.dart';

class Badges extends StatefulWidget{
  const Badges({super.key});

     @override
     State<Badges>createState()=>_BadgesState();
}

class _BadgesState extends State<Badges>{
     @override
     Widget build(BuildContext context){
          return  Stack(
              children: [
                 Positioned(
                  left:2,
                  child:Container(
                     child:const Text("2"),
                  )
                 ),
                 const Icon(Icons.shopping_basket)
              ],
          );
     }
}