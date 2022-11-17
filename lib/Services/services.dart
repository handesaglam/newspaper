import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newspaper/constant/appdata.dart';
import 'package:newspaper/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
 Iterable? list;
  Future<List<Model>> fetchdataall() async {
   
    // handleTick();
    final response =
        await http.get(Uri.parse("https://newsapi.org/v2/everything?q=besiktas&page=1&apiKey=90f78b5e459f4557a6d285161db89387"));

    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      // print(response.body);
      list = jsonResponse['articles'];
      print(list);

      return list!.map((model) => Model.fromJson(model)).toList();
    } else {
      throw Exception('Eror');
    }
  } 

  Future<List<Model>> fetchdataseach() async {
   
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   String? search=sharedPreferences.getString('search');


    // handleTick();
    final response =
        await http.get(Uri.parse("https://newsapi.org/v2/everything?q="+search.toString()+"&page=1&apiKey=90f78b5e459f4557a6d285161db89387"));

    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      // print(response.body);
      list = jsonResponse['articles'];
      print(list);

      return list!.map((model) => Model.fromJson(model)).toList();
    } else {
      throw Exception('Eror');
    }
  } 
  
  
  }