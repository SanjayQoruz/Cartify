import 'dart:convert';
import 'package:app/common/bottom_bar.dart';
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
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          token: '',
          address: '',
          type: '',
          cart: []);

      http.Response res = await http.post(Uri.parse("$url/api/signup"),
          body: user.toJson(),
          headers: <String, String>{'Content-Type': 'application/json'});

      print(res.body);
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
      {required email,
      required password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/signin"),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{'Content-Type': "application/json"});

      // ignore: use_build_context_synchronously
      errorHandler(
          res: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      customSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$url/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$url/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      customSnackBar(context, e.toString());
    }
  }
}
