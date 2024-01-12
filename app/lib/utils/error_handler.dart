import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './show_snackbar.dart';

void errorHandler({
   required http.Response res,
   required BuildContext context,
   required VoidCallback onSuccess
}){
      switch(res.statusCode){
          case 200:
              onSuccess();
              break;
           case 201:
              onSuccess();
              break;
           case 401:
               customSnackBar(context,jsonDecode(res.body)['message']);
                break;
           case 404:
             customSnackBar(context,jsonDecode(res.body)['message']);
             break;
           case 500:
              customSnackBar(context,jsonDecode(res.body)['message']);
              break;
           default:
              customSnackBar(context,jsonDecode(res.body)['message']);
      }
}