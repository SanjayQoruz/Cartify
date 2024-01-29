import 'package:app/common/bottom_bar.dart';
import 'package:app/pages/pages.dart';
import 'package:app/provider/user_provider.dart';
import 'package:app/services/services.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
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
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const Center(child: Text("admin screen"),)
          : const AuthPage(),
    );
  }
}

