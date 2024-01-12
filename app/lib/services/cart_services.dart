import 'dart:convert';

import 'package:http/http.dart' as https;
import './../models/models.dart';
import './../constant/constant.dart';

class CartServices {

  Future<List<Product>>getProduct()async{

     https.Response res = await https.get(
        Uri.parse(productUrl),
        headers: <String,String>{
            "Content-type":"application/json"
        }
     );
     print(jsonDecode(res.body));

     return [];
  }
}