import 'dart:convert';
import 'package:app/common/bottom_bar.dart';
import 'package:app/pages/pages.dart';
import 'package:app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/constant/constant.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../models/models.dart';

class AuthService {
  void signUp(
      {required name,
      required email,
      required password,
      required BuildContext context}) async {    
    try {
      User user = User(id: '', name:name, email:email, password:password,token: '');

      http.Response res = await http.post(Uri.parse("$url/api/auth/sign-up"),
          body: user.toJson(),
          headers: <String, String>{'Content-Type': 'application/json'});

      // ignore: use_build_context_synchronously
      errorHandler(
          res: res,
          context: context,
          onSuccess: () {
            customSnackBar(context, "Account has been created Successfully");
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      customSnackBar(context, e.toString());
    }
  }

  void signIn(
      {
      required email,
      required password,
      required BuildContext context}) async {
         
          try {
             http.Response res =await http.post(
               Uri.parse("$url/api/auth/sign-in"),
               body:jsonEncode({
                   "email":email,
                   "password":password
               }),
               headers: <String,String>{
                   'Content-Type':"application/json"
               }
             );
             var data=json.decode(res.body);

             // ignore: use_build_context_synchronously
             errorHandler(res: res, context: context, onSuccess:()async{
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 // ignore: use_build_context_synchronously
                 Provider.of<UserProvider>(context,listen:false).setUser(data);
                 await prefs.setString("access-token",data["restData"]['token']);
                 // ignore: use_build_context_synchronously
                 Navigator.pushNamed(context,BottomBar.routeName);
             });
          } catch (e){
              // ignore: use_build_context_synchronously
              customSnackBar(context,e.toString());
          }
      }
}