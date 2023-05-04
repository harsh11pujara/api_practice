import 'dart:convert';

import 'package:http/http.dart' as http;

class Helper{
  String url = "https://crudcrud.com/api/5f854afdb9664bdd82c058a11e8a0553/users";

  insertData({ required Map<String,String> body}) async{
    var data = jsonEncode(body);
    var response = await http.post(Uri.parse(url),body: data,headers: {
      "Content-Type": "application/json"});
    print("insert response "+response.body.toString());
  }
  
  fetchData() async {
    var response = await http.get(Uri.parse(url));
    print("fetch response "+response.body.toString());

  }

  updateData(){

  }

  deleteData(){

  }
}