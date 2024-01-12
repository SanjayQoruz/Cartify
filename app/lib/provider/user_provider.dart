import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier{
       User _user = User(id: '', name: '', email: '', password: '', token: '');

       /* getter and setter 
           
           return_type get field_name{

           } 

           int get num => _n;

       **/

       User get user => _user;

       void setUser(dynamic user){
           _user  = User.fromMap(user['restData']);
           notifyListeners();
       }
       
}