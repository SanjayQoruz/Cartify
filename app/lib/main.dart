import 'package:app/pages/pages.dart';
import 'package:app/provider/user_provider.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes.dart';

void main() {
  runApp(
       MultiProvider(
        providers:[
            ChangeNotifierProvider(create:(context)=>UserProvider())
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: (settings) => genrateRoutes(settings),
      debugShowCheckedModeBanner: false,
      title: 'Cartify',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
            elevation:0,
            iconTheme:IconThemeData(
               color: Colors.black
            )
        ),
        colorScheme:const ColorScheme.light(
            primary:AppColor.secondaryColor
        ),
        useMaterial3: true,
      ),
      home:const AuthPage()
    );
  }
}

