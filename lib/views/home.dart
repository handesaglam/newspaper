import 'package:flutter/material.dart';
import 'package:newspaper/Services/services.dart';
import 'package:newspaper/constant/appdata.dart';
import 'package:newspaper/view_model/list_view_model.dart';
import 'package:newspaper/views/detail.dart';
import 'package:newspaper/views/search.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
searchdatasave(String data) async{
SharedPreferences preferences=await SharedPreferences.getInstance();
preferences.setString('search', data.toString());
  }

   ApiService apiService=new ApiService();
  
 @override
 Widget build(BuildContext context) {
 return Scaffold(
        appBar: buildAppBar(),
        body: context.watch<NewViewModel>().state == JobState.BUSY
 ? buildLoadingWidget()
 : context.watch<NewViewModel>().state == JobState.ERROR
 ? buildErrorWidget()
 : buildListView(context));
  }

 AppBar buildAppBar() {
 return AppBar(
  elevation: 0.0,
  backgroundColor: Colors.white,
      title: Text('News',style: TextStyle(color: Colors.black),),
    );
  }

 Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

 Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

 buildListView(BuildContext context) {
 return Column(
mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Container(
  padding: EdgeInsets.only(left: 10,right: 10),
child: TextField(
  onChanged: ((value) {
    search=value.toString();

    if(value.toString().length>3){
 searchdatasave(value.toString());
    Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => SearchData(
    ),
  ),
);
    }
 
;
//SearchData

   
                    
  }),
controller: myController,
          style: TextStyle(fontSize: 25.0),
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white, width: 18.0),
                    borderRadius: BorderRadius.circular(15.0)
              ),
            )
),

),

   new Expanded(child: ListView.builder(
   itemBuilder: (_, index) => buildListItem(context, index)))
            

    ],

 );
  }

 Widget buildListItem(BuildContext context, int index) {
 final news = context.read<NewViewModel>().newList[index];
 return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Detail(url:news.urlToImage.toString(),title: news.title.toString(),
    date: news.date.toString(),description: news.descriptipn.toString(),
    pageurl: news.url.toString(),
    author: news.author.toString(),
    ),
  ),
);
        },
        child: ListTile(
title: Text(news.title.toString()),
      subtitle: Text(news.descriptipn.toString().substring(0,50)),
        trailing: Image.network(news.urlToImage.toString(),
        fit: BoxFit.cover,
        ),
      ),
      )
    );
  }
}

