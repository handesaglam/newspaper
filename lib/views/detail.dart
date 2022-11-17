import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newspaper/model/data.dart';
import 'package:newspaper/root/root.dart';
import 'package:newspaper/views/home.dart';
import 'package:newspaper/views/showsources.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
String? url;
String? title;
String? date;
String? description;
String? pageurl;

String? author;
Detail({required this.url,required this.title,required this.date, required this.description,
required this.pageurl,required this.author
});
 

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {


  share(String data){
  Share.share(data.toString());

  }
  addfavorite(String title,String description,String image) async {

  SharedPreferences preferences=await SharedPreferences.getInstance();
  final data=Data(
  title:widget. title.toString(),
  descrition: widget.description.toString(),
  image: widget.url.toString()
);
  String json=jsonEncode(data);
  preferences.setString('user_data', json);


  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
   appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    leading: InkWell(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      },
child: Icon(Icons.arrow_back_ios,color: Colors.black,),

    ),
    actions: [
        IconButton(
      icon: Icon(
        Icons.cloud_upload_outlined,
        color: Colors.black,
      ),
      onPressed: () {
      share(widget.description.toString());
      },
    ),

      IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      onPressed: () {
        print(widget.pageurl.toString());
 addfavorite(widget.title.toString(), widget.description.toString(), widget.url.toString());
      },
    )
    ],
   ),
body: Column(
children: [
  Container(
    padding: EdgeInsets.only(left: 10,right: 10),
    width: MediaQuery.of(context).size.width,
    height: 270,
    child: Image.network(widget.url.toString(),
    fit: BoxFit.cover,
    ),
  ),
SizedBox(height: 10,),
  Container(
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Text(widget.title.toString(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
  ),

  SizedBox(height: 10,),

  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
child: Row(
  children: [
    Icon(Icons.calendar_month),

Text(widget.date.toString())

  ],
),


),
Container(
child: Row(
  children: [
    Icon(Icons.home_work_sharp),
Text(widget.author.toString())
  ],
),
),

],

  ),
SizedBox(height: 20,),
Container(
child: Text(widget.description.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),

),
Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               
        InkWell(
          onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ShowSources(
url:widget.url,
pageurl: widget.pageurl.toString(),

          )));

          },
child:       Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
color: Colors.white,

border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
                ),
child: Center(
child:Text("News Sources"),

)


              ),

        )


              ],
            ),
          )

],

),

    );
  }
}