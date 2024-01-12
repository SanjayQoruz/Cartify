import 'package:app/common/bottom_bar.dart';
import 'package:app/pages/pages.dart';
import 'package:flutter/material.dart';

Route<dynamic> genrateRoutes(RouteSettings settings){
       switch(settings.name){
             case AuthPage.routeName:
                 return MaterialPageRoute(builder: (_)=>const AuthPage());
             case HomeScreen.routeName:
                 return MaterialPageRoute(builder:(_)=>const HomeScreen());
             case BottomBar.routeName:
                 return MaterialPageRoute(builder:(_)=>const BottomBar());
            default:
              return MaterialPageRoute(builder:(_)=>const Scaffold(
                  body:Text("No Routes !!!!"),
              ));
       }
}