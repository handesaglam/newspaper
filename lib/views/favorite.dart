import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newspaper/model/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  String? url;
  String? title;
  String? description;

loaddata() async {
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
String? json=sharedPreferences.getString('user_data');
print(json.toString()+"mmmmmm");
if(json==null){


}else{
Map<String ,dynamic> map=jsonDecode(json);
final user=Data.fromJson(map);

setState(() {
  url=user.image.toString();
title=user.title.toString();
description=user.descrition.toString();
});
print(url.toString());
}


}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  setState(() {
      loaddata();
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Favorite",style: TextStyle(color: Colors.black ),),
        leading: InkWell(
          onTap: () {
          

          },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,),  
        ),
      ),
body: Column(
children: [
Card(
      child: InkWell(
        onTap: () {
  
        },
        child: ListTile(
title: Text(title.toString()),
      subtitle: Text(description.toString().substring(0,10)),
      trailing: Image.network(url.toString(),
      fit: BoxFit.cover,
      ),
     
      ),
      )
  
)
],
)


    );
  }
}